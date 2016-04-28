function kBlocks = intoBlocks( inputImage, sizeOfBlock, shift )
%IMAGEINTOBLOCKS Splits the input image into blocks of the size sizeBlock
%and overlapped by shiftBlock

[nRows nColumns ] = size(inputImage);
nBlocks = (((nRows - sizeOfBlock) / shift) + 1) * (((nColumns - sizeOfBlock) / shift) + 1);
blocks = zeros(sizeOfBlock, sizeOfBlock, nBlocks);
keys = zeros(2, nBlocks);

iterator = 1;
for r = 1:shift:(nRows-sizeOfBlock+1)
    for c = 1:shift:(nColumns-sizeOfBlock+1)
        blocks(:,:,iterator) = inputImage(r:(r+sizeOfBlock-1), c:(c+sizeOfBlock-1));
        keys(:,iterator) = [r c];
        iterator = iterator + 1;
    end
end

kBlocks.keys = keys;
kBlocks.blocks = blocks;

end

