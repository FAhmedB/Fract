function [ quantA ] = quantAlpha( alpha )
%QUANTALPHA Summary of this function goes here
%   Detailed explanation goes here

alphaValues = [0.55 0.7 0.85 1];
[A I] = min(abs(alphaValues - alpha));
quantA = alphaValues(I);


end

