function [ line column delta alpha] = findBestTransform( block, kBlocks )
%FINDBESTTRANSFORMEDGE Summary of this function goes here
%   Detailed explanation goes here


nBlocks = length(kBlocks.keys);
error = inf;

for i = 1:nBlocks
    blockTemp = kBlocks.blocks(:,:,i);
    keyTemp = kBlocks.keys(:,i);
    alphaTemp = 0.5;
    deltaTemp = round((averageIntensity(block) - alphaTemp*averageIntensity(blockTemp)));
    errorTemp = rmse(block,transform(blockTemp, deltaTemp, alphaTemp));
    if errorTemp < error
        error = errorTemp;
        line = keyTemp(1);
        column = keyTemp(2);
        alpha = alphaTemp;
        delta = deltaTemp;
    end
end




end

