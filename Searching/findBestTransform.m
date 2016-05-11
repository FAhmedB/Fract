function [ line column symmetry] = findBestTransform( block, kBlocks )
%FINDBESTTRANSFORMEDGE Summary of this function goes here
%   Detailed explanation goes here


nBlocks = length(kBlocks.keys);
error = inf;

for i = 1:nBlocks
    blockTemp = kBlocks.blocks(:,:,i);
    keyTemp = kBlocks.keys(:,i);
    for sym = 0:3
        errorTemp = berror(block,isometry(blockTemp, sym));
        if errorTemp < error
            error = errorTemp;
            line = keyTemp(1);
            column = keyTemp(2);
            symmetry = sym;
        end
        
    end
 
end

