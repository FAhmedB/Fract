function [ thresh ] = estimateThresh( img,transforms, name, arrayOfObjects )
%ESTIMATETHRESH Summary of this function goes here
%   Detailed explanation goes here

decImage = decodeFractalImage( transforms, img, 1);
errorOfObject = berror(img, decImage);

errors = zeros(1,length(arrayOfObjects));
it = 0;
if isempty(arrayOfObjects)
    thresh = errorOfObject + 0.08;
else
    for o = arrayOfObjects
        if ~strcmp(name,o.name)
            it = it +1;
            decodedImage = decodeFractalImage( transforms, o.image, 1);
            errors(it)  = berror(o.image, decodedImage);
        end
    end
    avError = mean(errors);
    thresh = (avError + 2*errorOfObject)/3;
end
end

