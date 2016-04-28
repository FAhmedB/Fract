function [ newImage ] = decodeFractalImage( transforms, inputImage, numberOfIterations)
%DECODEIMAGE Summary of this function goes here
%   Detailed explanation goes here

nBlocks = length(transforms);
newImage = normalizeImage(inputImage);
for iteration=1:numberOfIterations
    initialImage = newImage;
    for i = 1:nBlocks
        D = transforms(1,i);
        iD = transforms(2,i);
        jD = transforms(3,i);
        B = transforms(4,i);
        iR = transforms(5,i);
        jR = transforms(6,i);
        delta = transforms(7,i);
        alpha = transforms(8,i);
        newImage(iR:iR+B-1,jR:jR+B-1) = transform(shrinkBlock(initialImage(iD:iD+D-1,jD:jD+D-1),B),delta, alpha);        
    end
end

end

