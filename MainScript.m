% Add path of sub-folders
addpath(genpath(fileparts(mfilename('fullpath'))));

start = cputime;

transforms = encodeFractalImage( 'Images/zlena-128x128.jpg');

encodingTime = cputime - start;

start = cputime;

decodedImage = decodeFractalImage( transforms, [Cst.DEFINITION, Cst.DEFINITION], 7);

decodingTime = cputime - start;
imshow(uint8(decodedImage));