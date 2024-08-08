function [isFound, Decom] = decompose_leastSquares(varargin)
%
% [isFound, Decom] = decompose_leastSquares(varargin)
%
%    
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
%

%% Check input

[J, d1, d2, tol, options] = check_input(varargins);


%% Prepare variables

[x0,A,b,Aeq,beq,lb,ub] = prepare_variables(d1, d2, options);


%% Prepare objective




end