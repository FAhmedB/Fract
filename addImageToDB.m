function  addImageToDB( image, imageName )
%ADDIMAGETODB Summary of this function goes here
%   Detailed explanation goes here

transforms = encodeFractalImage(image);
newImageEntry.transforms = transforms;
newImageEntry.name = imageName;
if (exist('fractalDB.mat','file') ~= 2)
    arrayOfObjects = [];
    save('fractalDB.mat','arrayOfObjects');
end
db = load('fractalDB.mat');
arrayOfObjects = [db.arrayOfObjects, newImageEntry];
save('fractalDB.mat','arrayOfObjects');

end

