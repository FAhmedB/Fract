function [ outputBlock ] = transform( block, delta, alpha, isometryNumber )
%TRANSFORM Summary of this function goes here
%   Detailed explanation goes here

outputBlock = alpha * block + delta;
end

