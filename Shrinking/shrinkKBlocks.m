function [ shrunkKBlocks ] = shrinkKBlocks( kBlocks, newSize1, newSize2 )
%RESIZEINDEXEDBLOCKS Summary of this function goes here
%   Detailed explanation goes here

nBlocks = size(kBlocks.blocks,3);
shrunkKBlocks.keys = kBlocks.keys;
shrunkKBlocks.blocks = logical(zeros(newSize1, newSize2, nBlocks));

for i= 1:nBlocks
    blockTemp = kBlocks.blocks(:,:,i);
    shrunkKBlocks.blocks(:,:,i) = shrinkBlock(blockTemp, newSize1, newSize2);
end
    
end

