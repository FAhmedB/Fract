function [ accuracy elapsedTime ] = accuracyOfConfig( db )
%ACCURACYOFCONFIG Summary of this function goes here
%   Detailed explanation goes here

numberOfAllImages = 0;
accuracyN = 0;
tic
for imageList = db
    for image = imageList.images
        numberOfAllImages = numberOfAllImages + 1;
        imagePath = strcat('images/',image{1});
        recognizedObject = recognizeObject(imagePath);
        if strcmp(recognizedObject,imageList.name)
            accuracyN = accuracyN + 1;
            
        end
    end
end
elapsedTime = toc;
accuracy = accuracyN *100 / numberOfAllImages;
end

