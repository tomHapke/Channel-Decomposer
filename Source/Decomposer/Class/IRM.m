%% IRM decomposition solver
%
%   Solve decomposition problem by relaxing the rank contraint
%   by minimizig the (d1+1)-smallest eigenvalue iteravely.
%   For the SDP subproblem, we use the YALMIP interface (https://yalmip.github.io/)
%   and the Mosek SDP solver (https://www.mosek.com/).
%

classdef  IRM < Decomposer

    methods 

        function [isFound, Decom, error] = decompose(varargin)
            %
            % [isFound, Decom, error] = decompose(varargin)
            %
            %   Solve decomposition problem by relaxing the rank contraint
            %   by minimizig the (d1+1)-smallest eigenvalue iteravely.
            %   For the SDP subproblem, we use the YALMIP interface (https://yalmip.github.io/)
            %   and the Mosek SDP solver (https://www.mosek.com/).
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
            %   error   : double - l2 decomposition error, norm specified in options
            %

            [isFound, DecomTemp, errorTemp] = decompose_IRM(varargin);

            if nargout >= 2
                Decom = DecomTemp;
                if nargout == 3
                    error =  errorTemp;
                end
            end

        end

    end

end