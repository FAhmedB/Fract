% Add path of sub-folders
addpath(genpath(fileparts(mfilename('fullpath'))));

start = cputime;

transforms = encodeFractalImage( 'Images/oh1.jpg');

encodingTime = cputime - start;

start = cputime;

decodedImage = decodeFractalImage( transforms, imread('Images/oh1.jpg'), 1);

decodingTime = cputime - start;
imshow(decodedImage);