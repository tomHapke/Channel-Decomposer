%% LeastSquares decomposition solver
%

classdef  LeastSquares < Decomposer

    methods 

        function [isFound, Decom, error] = decompose(varargin)

            [isFound, DecomTemp, errorTemp] = decompose_leastSquares(varargin);

            if nargout >= 2
                Decom = DecomTemp;
                if nargout == 3
                    error =  errorTemp;
                end
            end

        end

    end

end