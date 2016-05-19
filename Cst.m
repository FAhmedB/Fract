classdef Cst
    methods (Static)
        
        function out = DEFINITION(data)
            persistent var;
            if isempty(var)
                var = 512;
            end
            if nargin
                var = data;
            end
            out = var;
        end
        
        function out = SHIFTSCALE(data)
            persistent var;
            if isempty(var)
                var = .2;
            end
            if nargin
                var = data;
            end
            out = var;
        end
        
        function out = FUDGE_FACTOR(data)
            persistent var;
            if isempty(var)
                var = .35;
            end
            if nargin
                var = data;
            end
            out = var;
        end
        
        function out = ST_LINE_LENGTH(data)
            persistent var;
            if isempty(var)
                var = 2;
            end
            if nargin
                var = data;
            end
            out = var;
        end
        
        function out = BORDER_CONNECTIVITY(data)
            persistent var;
            if isempty(var)
                var = 4;
            end
            if nargin
                var = data;
            end
            out = var;
        end
        
        function out = ST_DIAMOND_R(data)
            persistent var;
            if isempty(var)
                var = 1;
            end
            if nargin
                var = data;
            end
            out = var;
        end
        
        function out = THRESHOLDING_FACTOR(data)
            persistent var;
            if isempty(var)
                var = .85;
            end
            if nargin
                var = data;
            end
            out = var;
        end
        
        function out = N_MINIMA(data)
            persistent var;
            if isempty(var)
                var = 3;
            end
            if nargin
                var = data;
            end
            out = var;
        end
        
        function out = N_OBJECTS_PER_IMAGE(data)
            persistent var;
            if isempty(var)
                var = 3;
            end
            if nargin
                var = data;
            end
            out = var;
        end
        
        function out = DETECTION_THRESHOLD(data)
            persistent var;
            if isempty(var)
                var = 0.26;
            end
            if nargin
                var = data;
            end
            out = var;
        end
        
        function out = DEV(data)
            persistent var;
            if isempty(var)
                var = false;
            end
            if nargin
                var = data;
            end
            out = var;
        end
        
    end
    
end
