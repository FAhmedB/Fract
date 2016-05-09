function [ transforms ] = encodeFractalImage(image)
%ENCODEFRACTAL Summary of this function goes here
%The eight values of a transform
% 1. Line position of the range block iR
% 2. Column position of the range block jR
% 3. corresponding line position of the domain block iD
% 4. corresponding column position of the domain block jD
% 5. symmetry


readImage = imread(image);
img = normalizeImage(readImage);


kBlocksR = intoRangeBlocks(img);
kBlocksD = intoDomainBlocks(img);

nBlocksR = length(kBlocksR.keys);
size1BlockR = size(kBlocksR.blocks(:,:,1),1);
size2BlockR = size(kBlocksR.blocks(:,:,1),2);

size1BlockD = size(kBlocksD.blocks(:,:,1),1);
size2BlockD = size(kBlocksD.blocks(:,:,1),2);

transforms = zeros(5,nBlocksR);

resizedKBlocksD = shrinkKBlocks(kBlocksD, sizeBlockR);


h = waitbar(0,'Encoding progress ... ');
    

for i = 1:nBlocksR
    key = kBlocksR.keys(:,i);
    block = kBlocksR.blocks(:,:,i);
    transforms(1,i) = key(1);
    transforms(2,i) = key(2);
    [transforms(3,i) transforms(4,i) transforms(5,i)] = findBestTransform(block, resizedKBlocksD);
    waitbar(i / nBlocksR)
end
close(h)
            
            
    

end

