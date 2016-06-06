function name = recognizeObject( img )
%RECOGNIZEOBJECT Summary of this function goes here
%   Detailed explanation goes here

img = normalizeImage(imread(img));
img = cropToObject(img,1);
img = img{1};
db = load('fractalDB.mat');
arrayOfObjects = db.arrayOfObjects;
nObjets = length(arrayOfObjects);
error = zeros(nObjets,1);
parfor i = 1: nObjets 
    o = arrayOfObjects(i);
    decodedImage = decodeFractalImage( o.transforms, img, 1);
    error(i) = berror(img, decodedImage)
end
[junk idx] = min(error);
name = arrayOfObjects(idx).name; 
NET.addAssembly('System.Speech');
obj = System.Speech.Synthesis.SpeechSynthesizer;
obj.Volume = 100;
%Speak(obj, name);


