function [ db ] = arrayOfAll(dataset )
%ARRAYOFALL Summary of this function goes here
%   Detailed explanation goes here

switch dataset
    case 1
        
        if ~Cst.DEV
            db(1).name = 'bic';
            db(1).images = {'bic1.jpg', 'bic2.jpg', 'bic3.jpg', 'bic4.jpg', 'bic5.jpg'};
            
            db(2).name = 'cable';
            db(2).images = {'cable1.jpg', 'cable2.jpg', 'cable3.jpg', 'cable4.jpg'};
            
            db(3).name = 'money';
            db(3).images = {'money1.jpg', 'money2.jpg', 'money3.jpg', 'money4.jpg'};
            
            db(4).name = 'stylo';
            db(4).images = {'stylo1.jpg', 'stylo2.jpg', 'stylo3.jpg', 'stylo4.jpg', 'stylo5.jpg', 'stylo6.jpg'};
            
            db(5).name = 'oh';
            db(5).images = {'oh1.jpg', 'oh2.jpg', 'oh3.jpg', 'oh4.jpg'};
            
            db(6).name = 'tabac';
            db(6).images= {'tabac1.jpg', 'tabac2.jpg', 'tabac3.jpg', 'tabac4.jpg'};
            
            db(7).name = 'hat';
            db(7).images= {'hat1.jpg', 'hat2.jpg', 'hat3.jpg', 'hat4.jpg', 'hat5.jpg'};
            
            db(8).name = 'other';
            db(8).images = { 'DB/bag/image_0001.jpg', 'DB/bag/image_0002.jpg', 'DB/bag/image_0003.jpg', 'DB/bag/image_0004.jpg', 'DB/bag/image_0005.jpg', 'DB/cup/image_0001.jpg', 'DB/cup/image_0002.jpg', 'DB/cup/image_0003.jpg', 'DB/cup/image_0004.jpg', 'DB/phone/image_0001.jpg', 'DB/phone/image_0002.jpg', 'DB/phone/image_0003.png', 'DB/phone/image_0004.jpg', 'DB/phone/image_0005.png', 'DB/wallet/image_0001.jpg', 'DB/wallet/image_0002.jpg', 'DB/wallet/image_0003.jpg', 'DB/wallet/image_0004.jpg', 'DB/wallet/image_0005.jpg'};
        else
            db(1).name = 'bic';
            db(1).images = {'bic1.jpg'};
            db(2).name = 'stylo';
            db(2).images = {'stylo1.jpg'};
        end
    case 2
        db(1).name = 'bag';
        db(2).name = 'bottles of water';
        db(3).name = 'charger';
        db(4).name = 'comb';
        db(5).name = 'cup';
        db(6).name = 'dishes';
        db(7).name = 'fork';
        db(8).name = 'frying pan';
        db(9).name = 'hat';
        db(10).name = 'headphone';
        db(11).name = 'insecticide';
        db(12).name = 'key';
        db(13).name = 'lighter';
        db(14).name = 'medecine';
        db(15).name = 'money';
        db(16).name = 'nail clipper';
        db(17).name = 'phone';
        db(18).name = 'scissors';
        db(19).name = 'shoes';
        db(20).name = 'tabac';
        db(21).name = 'toothbrush';
        db = fillImagesIntoDB(db);
end
  
end

function dbFilled = fillImagesIntoDB(db)

nObjects = length(db);
for i = 1:nObjects
    dbFilled(i).name = db(i).name;
    dbFilled(i).images = getAllFiles(['images/dataset/' db(i).name])';
end

end

function fileList = getAllFiles(dirName)

  dirData = dir(dirName);      %# Get the data for the current directory
  dirIndex = [dirData.isdir];  %# Find the index for directories
  fileList = {dirData(~dirIndex).name}';  %'# Get a list of the files
  if ~isempty(fileList)
    fileList = cellfun(@(x) fullfile(dirName,x),...  %# Prepend path to files
                       fileList,'UniformOutput',false);
  end
  subDirs = {dirData(dirIndex).name};  %# Get a list of the subdirectories
  validIndex = ~ismember(subDirs,{'.','..'});  %# Find index of subdirectories
                                               %#   that are not '.' or '..'
  for iDir = find(validIndex)                  %# Loop over valid subdirectories
    nextDir = fullfile(dirName,subDirs{iDir});    %# Get the subdirectory path
    fileList = [fileList; getAllFiles(nextDir)];  %# Recursively call getAllFiles
  end

end