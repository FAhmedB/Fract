function [ ac elapsedTime ] = accuracyOfConfig( db )
%ACCURACYOFCONFIG Summary of this function goes here
%   Detailed explanation goes here

tic
nImageList = length(db);
lastImageList = db(nImageList);
nAllImages = getNumPreviousList(db,lastImageList.name) + length(lastImageList.images);
accuracy = cell(nImageList,1);
parfor itImageList = 1:nImageList
    imageList = db(itImageList);
    nImages = length(imageList.images);
    for itImage = 1:nImages 
        image = imageList.images(itImage);
        imagePath = image{1};
        recognizedObject = recognizeObject(imagePath);
        if strcmp(recognizedObject,imageList.name)
            accuracy{itImageList}(itImage) =  1;
        end
       
    end
end

accArray = [];
for i = 1:nImageList
    accArray = [accArray, accuracy{i}];
end
ac = sum(accArray(:)/nAllImages);
elapsedTime = toc;
end