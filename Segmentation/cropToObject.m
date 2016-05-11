function [ finalObject ] = cropToObject( img )
%CROPTOOBJECT removes the background and return only
% the object in a new image

% Detecting edges
[junk threshold] = edge(img, 'sobel');
fudgeFactor = .5;
edges = edge(img,'sobel', threshold * fudgeFactor);

% Creating structuring elements
se90 = strel('line', 3, 90);
se0 = strel('line', 3, 0);

% Dilating the image
continuousEdges = imdilate(edges, [se90 se0]);

% Filling gaps
filledObj = imfill(continuousEdges, 'holes');

% Removing borders
withoutBorders = imclearborder(filledObj, 4);

% Smoothing
seD = strel('diamond',1);
smoothedObj = imerode(withoutBorders,seD);
smoothedObj = imerode(smoothedObj,seD);
figure, imshow(smoothedObj), title('Smoothed object');
% Finding regions
S = regionprops(smoothedObj, 'Area','BoundingBox');

% Finding the biggest region
All_areas = vertcat(S.Area);
[MaxArea, MaxAreaIdx] = (max(All_areas(:)));
biggestBox = S(MaxAreaIdx).BoundingBox;

grayObj = imcrop(img, biggestBox);
figure, imshow(grayObj), title('Gray Object');

bwObj = imcrop(smoothedObj, biggestBox);
figure, imshow(bwObj), title('Binary Object');
[rotation, box] = getBestRotation(bwObj)

bwObjCropped = imcrop(imrotate(bwObj,rotation),box);
figure, imshow(bwObjCropped), title('Binary Object Cropped');

grayObjCropped = imcrop(imrotate(grayObj,rotation),box);

grayObjWithoutBackground = uint8(bwObjCropped) .* grayObjCropped;
imshow(grayObjWithoutBackground), title('Object');

level = graythresh(grayObj);
finalObject = im2bw(grayObjWithoutBackground, 0.7*level);

if ~leftIsBigger(finalObject)
    finalObject = imrotate(finalObject,180);
end
figure, imshow(finalObject), title('Final Binary Object');
end

