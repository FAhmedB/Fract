function name = recognizeObject( image )
%RECOGNIZEOBJECT Summary of this function goes here
%   Detailed explanation goes here

img = normalizeImage(imread(image));
db = load('fractalDB.mat');
error = inf;
arrayOfObjects = db.arrayOfObjects;
for o = arrayOfObjects
    decodedImage = decodeFractalImage( o.transforms, img, 1);
    o.name
    errorTemp = berror(img, decodedImage);
    if errorTemp < error
        recognizedObject = o.name;
        error = errorTemp;
    end

end
name = recognizedObject;
NET.addAssembly('System.Speech');
obj = System.Speech.Synthesis.SpeechSynthesizer;
obj.Volume = 100;
Speak(obj, name);
