%% Superclass for decomposition solvers
%

classdef Decomposer

    methods (Abstract)
        [isFound, Decomp] = decompose(varargin)
    end

    methods 

        function [isFound, Decom] = decompose_rand(varargin)
            %TODO
            isFound = false;
            Decom = 0;
        end
    
        function Results         = decompose_analysis(varargin)
            %TODO
            Results = table([]);
        end

    end

end