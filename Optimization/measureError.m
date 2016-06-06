function [ error ] = measureError( objName, img )
%MEASUREERROR Summary of this function goes here
%   Detailed explanation goes here

db = load('fractalDB.mat');
arrayOfObjects = db.arrayOfObjects;
error = inf;
for o = arrayOfObjects
    if strcmp(o.name,objName)
        decodedImage = decodeFractalImage( o.transforms, img, 1);
        errorTemp = berror(img, decodedImage);
        if errorTemp < error
            error = errorTemp;
        end
    end
end

end

