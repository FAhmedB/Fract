function outputImage = normalizeImage( image )
%NORMALIZEIMAGE converts the image to gray and rescales it to the
%predefined size

outputImage = toGray(image);
if (length(outputImage) > Cst.DEFINITION)
    r = Cst.DEFINITION / length(outputImage);
    outputImage = imresize(outputImage,r);
end

end

