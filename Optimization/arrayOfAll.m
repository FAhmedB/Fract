function [ db ] = arrayOfAll( )
%ARRAYOFALL Summary of this function goes here
%   Detailed explanation goes here


if ~Cst.DEV
    db(1).name = 'bic';
    db(1).images = {'bic1.jpg', 'bic2.jpg', 'bic3.jpg', 'bic4.jpg', 'bic5.jpg'};
    
    db(2).name = 'cable';
    db(2).images = {'cable1.jpg', 'cable2.jpg', 'cable3.jpg', 'cable4.jpg'};
    
    db(3).name = 'money';
    db(3).images = {'money1.jpg', 'money2.jpg', 'money3.jpg', 'money4.jpg'};
    
    db(4).name = 'stylo';
    db(4).images = {'stylo1.jpg', 'stylo2.jpg', 'stylo3.jpg', 'stylo4.jpg', 'stylo5.jpg', 'stylo6.jpg'};
    
    db(5).name = 'oh';
    db(5).images = {'oh1.jpg', 'oh2.jpg', 'oh3.jpg', 'oh4.jpg'};
    
    db(6).name = 'tabac';
    db(6).images= {'tabac1.jpg', 'tabac2.jpg', 'tabac3.jpg', 'tabac4.jpg'};
    
    db(7).name = 'hat';
    db(7).images= {'hat1.jpg', 'hat2.jpg', 'hat3.jpg', 'hat4.jpg', 'hat5.jpg'};
else
    db(1).name = 'bic';
    db(1).images = {'bic1.jpg'};
    db(2).name = 'stylo';
    db(2).images = {'stylo1.jpg'};
end
end

