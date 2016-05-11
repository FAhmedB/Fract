function [box] = removeBlackBackground( img )
%REMOVEBLACKBACKGROUND Summary of this function goes here
%   Detailed explanation goes here

%From top
top = 1;
while all(~img(top,:))
    top = top+1;
end

left = 1;
while all(~img(:,left))
    left = left+1;
end

bottom = size(img, 1);
while all(~img(bottom,:))
    bottom = bottom-1;
end

right = size(img, 2);
while all(~img(:,right))
    right = right-1;
end

box = [left, top, right-left+1, bottom-top+1];
end

