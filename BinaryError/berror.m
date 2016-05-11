function [ error ] = berror( A, B )
%BERROR Summary of this function goes here
%   Detailed explanation goes here

errorM = xor(A,B);
error = sum(errorM(:));

end

