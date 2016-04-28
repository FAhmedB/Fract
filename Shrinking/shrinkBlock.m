function newBlock = shrinkBlock( block, newSize )
%SHRINKBLOCK Summary of this function goes here
%   Detailed explanation goes here

newBlock = imresize(block,[newSize newSize],'box');
end

