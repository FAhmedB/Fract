function [ isDetected ] = verifyObject( objName, img )
%VERIFYOBJECT Summary of this function goes here
%   Detailed explanation goes here

db = load('fractalDB.mat');
arrayOfObjects = db.arrayOfObjects;
for o = arrayOfObjects
    if strcmp(o.name,objName)
        decodedImage = decodeFractalImage( o.transforms, img, 1);
        errorTemp = berror(img, decodedImage);
        if errorTemp < o.thresh
            isDetected = true;
            return
        end
    end
    
end
isDetected = false;

end