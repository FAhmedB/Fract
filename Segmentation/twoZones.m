function [ smoothedObj ] = twoZones( img )
%TWOZONES Summary of this function goes here
%   Detailed explanation goes here

% Detecting edges
[junk threshold] = edge(img, 'sobel');
fudgeFactor = Cst.FUDGE_FACTOR;
edges = edge(img,'sobel', threshold * fudgeFactor);

% Creating structuring elements
se90 = strel('line', Cst.ST_LINE_LENGTH, 90);
se0 = strel('line', Cst.ST_LINE_LENGTH, 0);

% Dilating the image
continuousEdges = imdilate(edges, [se90 se0]);


% Filling gaps
filledObj = imfill(continuousEdges, 'holes');

% Smoothing
seD = strel('diamond',Cst.ST_DIAMOND_R);
smoothedObj = imerode(filledObj,seD);
smoothedObj = imerode(smoothedObj,seD);

end

