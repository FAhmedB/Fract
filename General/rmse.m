function [ r ] = rmse( data, estimation )
%RMSE Summary of this function goes here
%   Detailed explanation goes here

r = sqrt(sum((data(:)- estimation(:)).^2));

end

