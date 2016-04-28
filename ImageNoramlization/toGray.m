function [ outputImage ] = toGray( image )

outputImage = image;
if (size(image,3) > 1)
    outputImage = rgb2gray(outputImage);
end

end

