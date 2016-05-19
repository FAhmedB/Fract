function [ finalObject ] = cropToObject( img, nbrMinima )
%CROPTOOBJECT removes the background and return only
% the object in a new image


% two zones black and white
twoZ = twoZones(img);

% Finding regions
S = regionprops(twoZ, 'Area','BoundingBox');

% Finding the biggest region
All_areas = vertcat(S.Area);
[MaxArea, MaxAreaIdx] = (max(All_areas(:)));
if ~isempty(MaxArea)
    biggestBox = S(MaxAreaIdx).BoundingBox;
else
    finalObject{1} = zeros(64);
    disp('We have found no object here');
    return
end

grayObj = imcrop(img, biggestBox);
%figure, imshow(grayObj), title('Gray Object');


bwObj = imcrop(twoZ, biggestBox);
%figure, imshow(bwObj), title('Binary Object');
grayObjWithoutBackground = uint8(bwObj) .* grayObj;
%imshow(grayObjWithoutBackground), title('Object');

level = graythresh(grayObj);
finalObject0 = im2bw(grayObjWithoutBackground, Cst.THRESHOLDING_FACTOR*level);

%figure, imshow(finalObject0), title('Final Binary Object0 ');

[rotation box] = getBestRotation(finalObject0);
for i=1:nbrMinima
    rt = rotation(i);
    bx = box(i,:);
    
    finalObject{i} = imcrop(imrotate(finalObject0,rt),bx);
    
    
    if ~leftIsBigger(finalObject{i})
        finalObject{i} = imrotate(finalObject{i},180);
    end
    minsize = min(size(finalObject{i}));
    if minsize < 64
        finalObject{i} = imresize(finalObject{i}, 64/minsize,'box');
    end
    %figure, imshow(finalObject{i}), title('Final Binary Object');
end





