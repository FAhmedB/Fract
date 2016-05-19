function initDB( allImages )
%INITDB Summary of this function goes here
%   Detailed explanation goes here

delete('fractalDB.mat');
for imageList = allImages
        addImageToDB(imageList.images{1},imageList.name);
end

end

