function  addImageToDB( image, imageName )
%ADDIMAGETODB Summary of this function goes here
%   Detailed explanation goes here

readImage = imread(image);
img = normalizeImage(readImage);
if Cst.DEV
    croppedImages = cropToObject(img,1);
else
    croppedImages = cropToObject(img,Cst.N_MINIMA);
end

for i=1:length(croppedImages)
    transforms = encodeFractalImage(croppedImages{i});
    newImageEntry.image = croppedImages{i};
    newImageEntry.transforms = transforms;
    newImageEntry.name = imageName;
    if (exist('fractalDB.mat','file') ~= 2)
        arrayOfObjects = [];
        save('fractalDB.mat','arrayOfObjects');
    end
    db = load('fractalDB.mat');
    newImageEntry.thresh = estimateThresh(croppedImages{i},transforms, imageName, db.arrayOfObjects);
    arrayOfObjects = [db.arrayOfObjects, newImageEntry];
    arrayOfObjects = updateThresh(arrayOfObjects);
    save('fractalDB.mat','arrayOfObjects');
end

end

