function [ degrees, bestBox ] = getBestRotation( obj )
%GETBESTROTATION Summary of this function goes here
%   Detailed explanation goes here

smallestArea = inf;
degrees = 0;
bestBox = [0,0,0,0];
for d=0:1:90
    rotatedObj = imrotate(obj,d);
    box = removeBlackBackground(rotatedObj);
    area = box(3) * box(4);
    if area < smallestArea
        degrees = d;
        smallestArea = area;
        bestBox = box;
    end
end

if bestBox(3)<bestBox(4)
    degrees = degrees + 90;
    bestBox = removeBlackBackground(imrotate(obj,degrees));
end


end

