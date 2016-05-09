function [ error ] = berror( A, B )
%BERROR Summary of this function goes here
%   Detailed explanation goes here

error = sum(xor(A,B));

end

