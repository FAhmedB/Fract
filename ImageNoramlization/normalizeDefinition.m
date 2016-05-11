function [ outputImage ] = normalizeDefinition( image )

outputImage = shrinkBlock(image, Cst.DEFINITION, Cst.DEFINITION);

end

