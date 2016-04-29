classdef Cst
    properties (Constant = true)
        DEFINITION = 128;
       %B = 4;
        B= getappdata(0,'B') ;
        D = 2*Cst.B;
        ALPHA = 0.5;
    end
    
end