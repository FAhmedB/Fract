function initDB( allImages )
%INITDB Summary of this function goes here
%   Detailed explanation goes here

delete('fractalDB.mat');
nImageList = length(allImages);
for i = 1:nImageList
    imageList = allImages(i);
    addImageToDB(imageList.images{15},imageList.name);
end

end

