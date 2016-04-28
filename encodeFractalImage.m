function [ transforms ] = encodeFractalImage(image)
%ENCODEFRACTAL Summary of this function goes here
%The eight values of a transform
% 1. size of the domain block Cst.D
% 2. corresponding line of the domain block iD
% 3. corresponding column of the domain block jD
% 4. size of the range block Cst.B
% 5. corresponding line of the range block iR
% 6. corresponding column of the range block jR
% 7. luminance shift delta
% 8. contrast factor alpha
%   Detailed explanation goes here

readImage = imread(image);
img = normalizeImage(readImage);

kBlocksR = intoBlocks(img, Cst.B, Cst.B);
kBlocksD = intoBlocks(img, Cst.D, Cst.B);

nBlocksR = length(kBlocksR.keys);
sizeBlockR = length(kBlocksR.blocks(:,:,1));
sizeBlockD = length(kBlocksD.blocks(:,:,1));
transforms = zeros(8,nBlocksR);

resizedKBlocksD = shrinkKBlocks(kBlocksD, sizeBlockR);


h = waitbar(0,'Encoding progress ... ');
    

for i = 1:nBlocksR
    key = kBlocksR.keys(:,i);
    block = kBlocksR.blocks(:,:,i);
    transforms(1,i) = sizeBlockD;
    transforms(4,i) = sizeBlockR;
    transforms(5,i) = key(1);
    transforms(6,i) = key(2);
    [transforms(2,i) transforms(3,i) transforms(7,i) transforms(8,i)] = findBestTransform(block, resizedKBlocksD);
    waitbar(i / nBlocksR)
end
close(h)
            
            
    

end

