function [ arrayOfObjectsOut ] = updateThresh( arrayOfObjectsIn )
%UPDATETHRESH Summary of this function goes here
%   Detailed explanation goes here
it = 0;
arrayOfObjectsOut = arrayOfObjectsIn;
for o = arrayOfObjectsIn
    it = it + 1;
    arrayOfObjectsOut(it).thresh = estimateThresh(o.image, o.transforms, o.name, arrayOfObjectsIn);
end

end

