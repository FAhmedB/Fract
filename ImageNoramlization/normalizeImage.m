function outputImage = normalizeImage( image )
%NORMALIZEIMAGE converts the image to gray and rescales it to the
%predefined size


outputImage = normalizeDefinition(image);
outputImage = toGray(outputImage);
outputImage = cropToObject(outputImage);

end

