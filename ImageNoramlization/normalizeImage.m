function outputImage = normalizeImage( image )
%NORMALIZEIMAGE converts the image to gray and rescales it to the
%predefined size


outputImage = toGray(image);
outputImage = normalizeDefinition(outputImage);

end

