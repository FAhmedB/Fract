function name = recognizeObject( img )
%RECOGNIZEOBJECT Summary of this function goes here
%   Detailed explanation goes here

img = normalizeImage(imread(img));
img = cropToObject(img,1);
img = img{1};
db = load('fractalDB.mat');
error = inf;
arrayOfObjects = db.arrayOfObjects;
for o = arrayOfObjects
    decodedImage = decodeFractalImage( o.transforms, img, 1);
    errorTemp = berror(img, decodedImage);
    if errorTemp < error
        recognizedObject = o.name;
        error = errorTemp;
    end

end
name = recognizedObject
NET.addAssembly('System.Speech');
obj = System.Speech.Synthesis.SpeechSynthesizer;
obj.Volume = 100;
Speak(obj, name);
