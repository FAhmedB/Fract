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
        iR = floor(transforms(1,i) * nRows);
        jR = floor(transforms(2,i) * nColumns);
        iD = floor(transforms(3,i) * nRows);
        jD = floor(transforms(4,i) * nColumns);
        sym = transforms(5,i);
        newImage(iR+1:iR+B1,jR+1:jR+B2) = isometry(shrinkBlock(initialImage(iD+1:iD+D1,jD+1:jD+D2),B1,B2), sym);        
    end
end

end

