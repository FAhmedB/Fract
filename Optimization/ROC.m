%% Cleaning the environment
close all
clearvars

%% Preparing the list of all images
allImages = arrayOfAll(2);
objName = 'bag';
disp(objName)
f1 = [];
f0 = [];
trainingImage = [];

db = load('fractalDB.mat');
arrayOfObjects = db.arrayOfObjects;
sumSizes = 0;
sumOnes = 0;
iter = 0;
for o = arrayOfObjects
    if strcmp(o.name,objName)
        iter = iter +1;
        trainingImage = o.image;
        sumSizes = prod(size(trainingImage)) + sumSizes;
        sumOnes = sum(trainingImage(:))+ sumOnes;
    end
end

figure, imshow(trainingImage);
sizeImg = sumSizes /iter
ratioOnes = sumOnes / sumSizes
tic
nImageList = length(allImages);
lastImageList = allImages(nImageList);
nAllImages = getNumPreviousList(allImages,lastImageList.name) + length(lastImageList.images);

errors = cell(nImageList,1);
f1 = cell(nImageList,1);
f0 = cell(nImageList,1);

parfor itImageList = 1:nImageList
    imageList = allImages(itImageList);
    nImages = length(imageList.images);
    for itImage = 1:nImages 
        image = imageList.images(itImage);
        imagePath = image{1};
        img = imread(imagePath);
        img = normalizeImage(img);
        img = cropToObject(img,1);
        img = img{1};
        error = measureError(objName,img);
        errors{itImageList}(itImage).value = error;
        if strcmp(objName,imageList.name)
            realState = 'P';
            f1{itImageList}(itImage) = error;
        else
            realState = 'N';
            f0{itImageList}(itImage) = error;
        end
        errors{itImageList}(itImage).realState = realState;
        
    end
end
toc
%% Plotting the ROC
errorsArray = [];
for i = 1:nImageList
    errorsArray = [errorsArray, errors{i}];
end
f0Array = [];
for i = 1:nImageList
    f0Array = [f0Array, f0{i}];
end
f0Array(f0Array==0) = [];
f1Array = [];
for i = 1:nImageList
    f1Array = [f1Array, f1{i}];
end
f1Array(f1Array==0) = [];
nInstances = nAllImages;
P = 22;
N = nInstances - P;
sortedErrors = sortStruct(errorsArray, 'value',1) ;
TP = 0;
FP = 0;
ROCVector = zeros(nInstances,3);
it2 = 0;
for instance = sortedErrors
    it2 = it2 + 1;
    if strcmp(instance.realState,'P')
        TP = TP + 1;
    else
        FP = FP + 1;
    end
    ROCVector(it2,:) = [FP/N TP/P instance.value];
end

figure, plot(ROCVector(:,1), ROCVector(:,2),'-ob','LineWidth',2,'MarkerSize', 5), title(['ROC Curve of  ',objName]);
%text(ROCVector(:,1),ROCVector(:,2),num2str(ROCVector(:,3),2), 'FontSize', 8);
hold on
plot([0.02 0.02],[0 1], '--r');
plot([0 1],[0 1]);
hold off


%% Plotting the distribution of errors for N and P

pdf1 = fitdist(f1Array', 'normal');
pdf0 = fitdist(f0Array', 'ev');

mu1 = pdf1.mu;
sigma1 = pdf1.sigma;
mu0 = pdf0.mu;
sigma0 = pdf0.sigma;
labelpdf1 = {['\mu1 = ', num2str(mu1)], ['\sigma1 = ',num2str(sigma1)] };
labelpdf0 = {['\mu0 = ', num2str(mu0)],['\sigma0 = ',num2str(sigma0)]};



x = linspace(-0.1, 0.6,1000);
yf1 = pdf(pdf1,x);
yf0 = pdf(pdf0,x);
figure, plot(x,yf0,'r','LineWidth',2);%
%text(-0.02,6, labelpdf1,'color','b');
%text(0.45,6, labelpdf0,'color','r');
th = icdf(pdf0,0.02)

%% plotting the histogram of negative values
figure, hist(f0Array,12)










