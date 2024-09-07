function [obj, grad] = objectiveGradientLeastSquares(X)
%
% [obj, grad] = gradientLeastSquares(X)
%
%   Gradient function for LeastSquare problem.
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
%   obj    : double - 
%   grad   : [d1d2 x d1d2 x 2] double - value of gradient
%

global Jrg Jig d1g d2g


%% Compute decomposition difference Diffr and Diffi

d = d1g*d2g;

Diffr = Jrg - (X(:,:,1)*X(:,:,1)' + X(:,:,2)*X(:,:,2)')/d2g;
Diffi = Jig - (X(:,:,2)*X(:,:,1)' - X(:,:,1)*X(:,:,2)')/d2g;


%% Compute objective

obj = norm(Diffr,"fro")^2 ...
    + norm(Diffi,"fro")^2;


%% Compute gradient

if nargout > 1
    
    grad =  zeros(d,d,2);
    
    DiffiCut = Diffi;
    DiffiCut( (d+1)*(0:(d-1))+1 ) = 0; % Set diagonals to zero
    
    % Vectorized version of gradient formula (non-trivial) 
    
    grad(:,:,1) = -4/d2g * Diffr * X(:,:,1) + 4/d2g * DiffiCut * X(:,:,2);
    
    grad(:,:,2) = -4/d2g * Diffr * X(:,:,2) - 4/d2g * DiffiCut * X(:,:,1); 

end

end

