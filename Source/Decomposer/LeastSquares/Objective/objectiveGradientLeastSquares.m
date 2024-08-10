function [obj, grad] = objectiveGradientLeastSquares(X)
%
% value = gradientLeastSquares(X)
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

Temp = zeros(d,d,2);

for j  = 1: d2g 

    indexLeft  = (j-1)*d1g +1;
    indexRight = j*d1g;

    %% Range over d1g-wide columns

    % real part
    Temp(:,:,1) = Temp(:,:,1) + X(:,indexLeft:indexRight,1)*X(:,indexLeft:indexRight,1)' + X(:,indexLeft:indexRight,2)*X(:,indexLeft:indexRight,2)';

    % imaginary part
    Temp(:,:,2) = Temp(:,:,2) + X(:,indexLeft:indexRight,2)*X(:,indexLeft:indexRight,1)' - X(:,indexLeft:indexRight,1)*X(:,indexLeft:indexRight,2)';

end

Diffr = Jrg - Temp(:,:,1)/d2g;

Diffi = Jig - Temp(:,:,2)/d2g;


%% Compute objective

obj = norm(Diffr,"fro")^2 + norm(Diffi,"fro")^2;


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

