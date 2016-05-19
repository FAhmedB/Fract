close all;
I = imread('images/mixture.jpg');
figure, imshow(I);
I2 = normalizeImage(I);
obj = extractManyObjects(I2);
db = load('fractalDB.mat');
arrayOfObjects = db.arrayOfObjects;
for o = obj
    error = inf;
    for oDB = arrayOfObjects
        decodedImage = decodeFractalImage( oDB.transforms, o{1}, 1);
        errorTemp = berror(o{1}, decodedImage);
        if errorTemp < error
            recognizedObject = oDB.name;
            error = errorTemp;
        end
        
    end
    if (error > 0.26)
        name = 'UNKNOWN';
    else
        name = recognizedObject;
    end
    figure, imshow(o{1}), title(name);
end