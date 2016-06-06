function [ degrees, bestBox ] = getBestRotation( obj )
%GETBESTROTATION Summary of this function goes here
%   Detailed explanation goes here

smallestArea = inf * [1 1 1];
degrees = [0 0 0];
bestBox = zeros(3,4);



for d=0:1:90
    rotatedObj = imrotate(obj,d);
    box = removeBlackBackground(rotatedObj);
    area = box(3) * box(4);
    if (area < smallestArea(3)) && (area > smallestArea(2))
        degrees(3) = d;
        smallestArea(3) = area;
        bestBox(3,:) = box;
    elseif (area < smallestArea(2)) && (area > smallestArea(1))
        degrees(2) = d;
        smallestArea(2) = area;
        bestBox(2,:) = box;
    elseif area < smallestArea(1)
        degrees(1) = d;
        smallestArea(1) = area;
        bestBox(1,:) = box;
    end
end


if bestBox(3,3)< bestBox(3,4);
    degrees(3) = degrees(3) + 90;
    bestBox(3,:) = removeBlackBackground(imrotate(obj,degrees(3)));
end

if bestBox(2,3) < bestBox(2,4)
    degrees(2) = degrees(2) + 90;
    bestBox(2,:) = removeBlackBackground(imrotate(obj,degrees(2)));
end

if bestBox(1,3) < bestBox(1,4)
    degrees(1) = degrees(1) + 90;
    bestBox(1,:) = removeBlackBackground(imrotate(obj,degrees(1)));
end


end

