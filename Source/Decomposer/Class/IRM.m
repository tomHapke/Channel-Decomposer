%% IRM decomposition solver
%

classdef  IRM < Decomposer

    methods 

        function [isFound, Decom] = decompose(varargin)

            [isFound, DecomTemp] = decompose_IRM(varargin);

            if nargout >= 2
                Decom = DecomTemp;
            end

        end

    end

end