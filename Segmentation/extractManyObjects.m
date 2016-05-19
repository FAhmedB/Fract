function [ extractedObjs ] = extractManyObjects( img )
%EXTRACTMANYOBJECTS Summary of this function goes here
%   Detailed explanation goes here

% two zones black and white
twoZ = twoZones(img);

% Finding regions
S = regionprops(twoZ, 'Area','BoundingBox');

% Finding the biggest region
All_areas = vertcat(S.Area);
[SortedAreas, SortedAreasIdx] = sort(All_areas(:),'descend');
nAreas = length(SortedAreas);
if nAreas ~= 0
    N =  min(nAreas,Cst.N_OBJECTS_PER_IMAGE);
    biggestBoxs = zeros(N,4);
    for n=1:N
        biggestBoxs(n,:)= S(SortedAreasIdx(n)).BoundingBox;
    end
else
    extractedObjs{1} = zeros(64);
    disp('We have found no object here');
    return
end

for n=1:N
    grayObj = imcrop(img, biggestBoxs(n,:));
    %figure, imshow(grayObj), title('Gray Object');
    
    
    bwObj = imcrop(twoZ, biggestBoxs(n,:));
    %figure, imshow(bwObj), title('Binary Object');
    grayObjWithoutBackground = uint8(bwObj) .* grayObj;
    %imshow(grayObjWithoutBackground), title('Object');
    
    level = graythresh(grayObj);
    finalObject = im2bw(grayObjWithoutBackground, Cst.THRESHOLDING_FACTOR*level);
    %figure, imshow(finalObject);
    
    %figure, imshow(finalObject0), title('Final Binary Object0 ');
    
    [rt bx] = getBestRotation(finalObject);
    
    
    extractedObjs{n} = imcrop(imrotate(finalObject,rt(1)),bx(1,:));
    
    
    if ~leftIsBigger(extractedObjs{n})
        extractedObjs{n} = imrotate(extractedObjs{n},180);
    end
    minsize = min(size(extractedObjs{n}));
    if minsize < 64
        extractedObjs{n} = imresize(extractedObjs{n}, 64/minsize,'box');
    end
    %figure, imshow(extractedObjs{n}), title('Final Binary Object');
end
end



