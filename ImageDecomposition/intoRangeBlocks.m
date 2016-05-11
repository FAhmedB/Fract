function kBlocks = intoRangeBlocks( inputImage )
%IMAGEINTOBLOCKS Splits the input image into blocks of the size sizeBlock
%and overlapped by shiftBlock

[nRows nColumns ] = size(inputImage);
size1Block = floor(nRows/8);
size2Block = floor(nColumns/8);
blocks = logical(zeros(size1Block, size2Block, 64));
keys = zeros(2, 64);



iterator = 1;
for r = 1:size1Block:(nRows-size1Block+1)
    for c = 1:size2Block:(nColumns-size2Block+1)
        blocks(:,:,iterator) = inputImage(r:(r+size1Block-1), c:(c+size2Block-1));
        keys(:,iterator) = [r/nRows c/nColumns];
        iterator = iterator + 1;
    end
end

kBlocks.keys = keys;
kBlocks.blocks = blocks;

end

