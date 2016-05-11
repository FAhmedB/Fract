function outputBlock = isometry(block, isometryNumber )
%ISOMETRY Summary of this function goes here
%   Detailed explanation goes here

switch isometryNumber
    case 0
        outputBlock = block;
    case 1
        outputBlock = fliplr(block);
    case 2
        outputBlock = flipud(block);
    case 3
        outputBlock = rot90(block,2);
end

end


