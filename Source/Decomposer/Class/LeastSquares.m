%% LeastSquares decomposition solver
%
%   Minimize decompostion error in l2-norm. We represent 
%   the decomposing channels by d1*d2 x d1 columns in a d1*d2 x d1*d2 matrices
%   called X. The constraint guarantees trace preservability.
%

classdef  LeastSquares < Decomposer

    methods 

        function [isFound, Decom, error] = decompose(varargin)
            %
            % [isFound, Decom, error] = decompose(varargin)
            %
            %   Minimize decompostion error in l2-norm. We represent 
            %   the decomposing channels by d1*d2 x d1 columns in a d1*d2 x d1*d2 matrices
            %   called X. The constraint guarantees trace preservability.
            %
            % Input:
            %
            %   J       : [d1d2 x d1d2] complex - Choi Jamiolkowski matrix to decompose
            %   d1      : int - input dimension
            %   tol     : double - tolerance of decomposition (optional)
            %   options : struct - set various options (optional)
            %
            % Output:
            %
            %   isFound : logical - true iff decomposition found within tolerance
            %   Decom   : [1 x d2] cell - contains decomposition matrices
            %   error   : double - decomposition error, norm specified in options
            %

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