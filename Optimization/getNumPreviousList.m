function [ n ] = getNumPreviousList( db, objectName )
%GETNUMIPREVIOUSLIST Summary of this function goes here
%   Detailed explanation goes here
it = 1;
n = 0;
while ~strcmp(db(it).name,objectName) && it < 1000
    n = n + length(db(it).images);
    it = it +1;
    
end

