function [ croppedObject ] = cropToObject( img )
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

% Finding regions
S = regionprops(smoothedObj, 'Area','Eccentricity','Centroid','BoundingBox');

% Finding the biggest region
All_areas = vertcat(S.Area);
[MaxArea, MaxAreaIdx] = (max(All_areas(:)));
biggestBox = S(MaxAreaIdx).BoundingBox;

% Cropping
croppedObject = imcrop(img, biggestBox);

imshow(croppedObject), title('Object');
end

