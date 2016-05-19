%% Cleaning the database
clearvars

%% Preparing the list of all images

allImages = arrayOfAll();

% %% Searching for the best Definition
% 
% definitions = [1024];
% acDefinition = zeros(size(definitions));
% tDefinition = zeros(size(definitions));
% it = 0;
% for i = definitions
%     Cst.DEFINITION(i)
%     initDB(allImages);
%     it = it +1;
%     [acDefinition(it) tDefinition(it)] = accuracyOfConfig(allImages)
% end
% 
% [bestAcDefinition indBestAcDefinition] = max(acDefinition);
% bestDefinition = definitions(indBestAcDefinition);

Cst.DEFINITION(512);
% %% Searching the best Shift Scale
% shiftScales = [0.1 0.2 0.25 0.33 0.5];
% acShiftScales = zeros(size(shiftScales));
% tShiftScales = zeros(size(shiftScales));
% it = 0;
% for i = shiftScales
%     Cst.SHIFTSCALE(i);
%     initDB(allImages);
%     it = it +1;
%     [acShiftScales(it) tShiftScales(it)] = accuracyOfConfig(allImages);
% end
% 
% [bestAcShiftScale indBestAcShiftScale] = max(acShiftScales);
% bestShift = shiftScales(indBestAcShiftScale);
Cst.SHIFTSCALE(0.2);
% %% Searching the best Fudge Factor
% fudges = 0.1:0.05:0.9;
% acFudges = zeros(size(fudges));
% tFudges = acFudges;
% it = 0;
% for i = fudges
%     Cst.FUDGE_FACTOR(i);
%     initDB(allImages);
%     it = it +1;
%     [acFudges(it) tFudges(it)] = accuracyOfConfig(allImages);
% end
% 
% [bestAcFudge indBestAcFudge] = max(acFudges);
% bestFudge = fudges(indBestAcFudge);
Cst.FUDGE_FACTOR(0.35);
% 
% %% Searching the line length of the structuring element
% lLengths = 1:1:10;
% aclLengths = zeros(size(lLengths));
% tlLengths = aclLengths;
% it = 0;
% for i = lLengths
%     Cst.ST_LINE_LENGTH(i);
%     initDB(allImages);
%     it = it +1;
%     [aclLengths(it) tlLengths(it)] = accuracyOfConfig(allImages);
% end
% 
% [bestAclLengths indBestAclLengths] = max(aclLengths);
% bestlLength = lLengths(indBestAclLengths);
Cst.ST_LINE_LENGTH(2);
% %% Searching the best border connectivity
% connectivities = [4 6 8 18 26];
% acConnectivities = zeros(size(connectivities));
% tConnectivities = acConnectivities;
% it = 0;
% for i = connectivities
%     Cst.BORDER_CONNECTIVITY(i);
%     initDB(allImages);
%     it = it +1;
%     [acConnectivities(it) tConnectivities(it)] = accuracyOfConfig(allImages);
% end
% 
% [bestAcConnectivities indBestAcConnectivities] = max(acConnectivities);
% bestConnectivity = connectivities(indBestAcConnectivities);

% %% Searching the best diamond R
% diamondRs = 1:1:10;
% acDiamondRs = zeros(size(diamondRs));
% tDiamondRs = acDiamondRs;
% it = 0;
% for i = diamondRs
%     Cst.ST_DIAMOND_R(i);
%     initDB(allImages);
%     it = it +1;
%     [acDiamondRs(it) tDiamondRs(it)] = accuracyOfConfig(allImages)
% end
% 
% [bestAcDiamondRs indBestAcDiamondRs] = max(acDiamondRs);
% bestDiamondR = diamondRs(indBestAcDiamondRs);
Cst.ST_DIAMOND_R(1);

%% Searching the best thresholding factor
% threshFactors = 0.1:0.05:0.9;
% acThreshFactors = zeros(size(threshFactors));
% tThreshFactors = acThreshFactors;
% it = 0;
% for i = threshFactors
%     Cst.THRESHOLDING_FACTOR(i);
%     initDB(allImages);
%     it = it +1;
%     [acThreshFactors(it) tThreshFactors(it)] = accuracyOfConfig(allImages);
% end
% 
% [bestAcThreshFactors indBestAcThreshFactors] = max(acThreshFactors);
% bestThreshFactor = threshFactors(indBestAcThreshFactors);

Cst.THRESHOLDING_FACTOR(0.85);
% %% One time test
initDB(allImages);
% [ac t] = accuracyOfConfig(allImages)

% Searching the best number of minima
% minima = 4;
% acMinima = zeros(size(minima));
% tMinima = acMinima;
% it = 0;
% for i = minima
%     Cst.N_MINIMA(i);
%     initDB(allImages);
%     it = it +1;
%     [acMinima(it) tMinima(it)] = accuracyOfConfig(allImages)
% end