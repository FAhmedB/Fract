allImages = arrayOfAll();
threshVector = 0.44;
fP = zeros(size(threshVector));
fN = fP;
tP = fP;
tN = fP;
it = 0;
imageNames = {'bic', 'cable', 'money', 'stylo', 'oh', 'tabac', 'hat'};

for t = threshVector
    Cst.DETECTION_THRESHOLD(t);
    it = it + 1;
    for imageName = imageNames
        for imageList = allImages
            for image = imageList.images
                imagePath = strcat('images/',image{1});
                img = imread(imagePath);
                img = normalizeImage(img);
                img = cropToObject(img,1);
                img = img{1};
                if verifyObject(imageName{1}, img) && ~strcmp(imageName{1}, imageList.name)
                    fP(it) = fP(it)+1
                elseif ~verifyObject(imageName{1}, img) && strcmp(imageName{1}, imageList.name)
                    fN(it) = fN(it)+1
                elseif verifyObject(imageName{1}, img) && strcmp(imageName{1}, imageList.name)
                    tP(it) = tP(it)+1
                elseif ~verifyObject(imageName{1}, img) && ~strcmp(imageName{1}, imageList.name)
                    tN(it) = tN(it)+1
                    
                end
            end
        end
    end
end