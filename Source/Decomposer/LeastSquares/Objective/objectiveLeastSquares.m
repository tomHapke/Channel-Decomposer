function obj = objectiveLeastSquares(X)
%
% value = objectiveLeastSquares(X)
%
%   Objective function for LeastSquare problem.
%   We make use of the fact that 
%   Xj*ctranspose(Xj) = ( Re(Xj)*transpose(Re(Xj)) +
%   Im(Xj)*transpose(Im(Xj)) ) + i * ( Im(Xj)*transpose(Re(Xj)) - Re(Xj)*transpose(Im(Xj)))
%
% Input:
%   
%   X      : [d1d2 x d1d2 x 2] double - optimization variable
%
% Output:
%
%   obj    : double - value of objective
%

global Jrg Jig d1g d2g

%% Compute decomposition difference Diffr and Diffi

d = d1g*d2g;

Diffr = Jrg - (X(:,:,1)*X(:,:,1)' + X(:,:,2)*X(:,:,2)')/d2g;
Diffi = Jig - (X(:,:,2)*X(:,:,1)' - X(:,:,1)*X(:,:,2)')/d2g;


%% Compute objective

obj = norm(Diffr,"fro")^2 ...
    + norm(Diffi,"fro")^2;