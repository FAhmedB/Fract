function [ isLeft ] = leftIsBigger( img )
%LEFTISBIGGER Summary of this function goes here
%   Detailed explanation goes here

width = size(img, 2);
halfWidth = floor(width/2);
leftImage = img(:,1:halfWidth);
rightImage = img(:,halfWidth+1:width);
if sum(leftImage(:)) > sum(rightImage(:))
    isLeft = true;
else
    isLeft = false;

end

