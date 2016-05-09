function [ line column delta alpha symmetry] = findBestTransform( block, kBlocks )
%FINDBESTTRANSFORMEDGE Summary of this function goes here
%   Detailed explanation goes here


nBlocks = length(kBlocks.keys);
error = inf;

for i = 1:nBlocks
    blockTemp = kBlocks.blocks(:,:,i);
    keyTemp = kBlocks.keys(:,i);
    for sym = 1:4
        errorTemp = berror(block,isometry(block, sym);
        if errorTemp < error
            error = errorTemp;
            line = keyTemp(1);
            column = keyTemp(2);
            alpha = alphaTemp;
            delta = deltaTemp;
            symmetry = sym;
        end
        
    end
    
    
    
    
end

