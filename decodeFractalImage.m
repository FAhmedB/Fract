function [ newImage ] = decodeFractalImage( transforms, inputImage, numberOfIterations)
%DECODEIMAGE Summary of this function goes here
%   Detailed explanation goes here

newImage = inputImage;
nBlocks = length(transforms);
nRows = size(newImage,1);
B1 = floor(nRows/8);
D1 = 2*B1;
nColumns = size(newImage,2);
B2 = floor(nColumns/8);
D2 = 2*B2;
for iteration=1:numberOfIterations
    initialImage = newImage;
    for i = 1:nBlocks
        iR = floor(transforms(1,i) * (nRows-B1))+1;
        jR = floor(transforms(2,i) * (nColumns-B2))+1;
        iD = floor(transforms(3,i) * (nRows-D1))+1;
        jD = floor(transforms(4,i) * (nColumns-D2))+1;
        sym = transforms(5,i);
        newImage(iR:iR+B1-1,jR:jR+B2-1) = isometry(shrinkBlock(initialImage(iD:iD+D1-1,jD:jD+D2-1),B1,B2), sym);        
    end
end
 
end

