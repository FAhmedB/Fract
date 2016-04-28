function [ outputImage ] = normalizeDefinition( image )

outputImage = shrinkBlock(image, Cst.DEFINITION);

end

