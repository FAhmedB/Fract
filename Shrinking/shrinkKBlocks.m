function [ shrunkKBlocks ] = shrinkKBlocks( kBlocks, newSize )
%RESIZEINDEXEDBLOCKS Summary of this function goes here
%   Detailed explanation goes here

nBlocks = size(kBlocks.blocks,3);
shrunkKBlocks.keys = kBlocks.keys;
shrunkKBlocks.blocks = zeros(newSize, newSize, nBlocks);

for i= 1:nBlocks
    blockTemp = kBlocks.blocks(:,:,i);
    shrunkKBlocks.blocks(:,:,i) = shrinkBlock(blockTemp, newSize);
end
    
end

