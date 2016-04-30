function kBlocks = intoDomainBlocks( inputImage )
%IMAGEINTOBLOCKS Splits the input image into blocks of the size sizeBlock
%and overlapped by shiftBlock

shiftScale = Cst.SHIFTSCALE;


[nRows nColumns ] = size(inputImage);
size1Block = floor(nRows/4);
size2Block = floor(nColumns/4);
shift1 = floor(shiftScale*size1Block);
shift2 = floor(shiftScale*size2Block);
nBlocks = (((nRows - size1Block) / shift1) + 1) * (((nColumns - size2Block) / shift2) + 1);

blocks = logical(zeros(size1Block, size2Block, nBlocks));
keys = zeros(2, nBlocks);

iterator = 1;
for r = 1:shift1:(nRows-size1Block+1)
    for c = 1:shift2:(nColumns-size2Block+1)
        blocks(:,:,iterator) = inputImage(r:(r+size1Block-1), c:(c+size2Block-1));
        keys(:,iterator) = [r c];
        iterator = iterator + 1;
    end
end

kBlocks.keys = keys;
kBlocks.blocks = blocks;

end

