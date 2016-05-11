function newBlock = shrinkBlock( block, newSize1, newSize2 )
%SHRINKBLOCK Summary of this function goes here
%   Detailed explanation goes here

newBlock = imresize(block,[newSize1 newSize2],'box');
end

