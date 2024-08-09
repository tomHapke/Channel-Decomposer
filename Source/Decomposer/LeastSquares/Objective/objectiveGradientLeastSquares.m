function [obj, grad] = objectiveGradientLeastSquares(X,Jr,Ji,d2,d1)
%
% value = gradientLeastSquares(X,Jr,Ji,d2,d1)
%
%   Gradient function for LeastSquare problem.
%   We make use of the fact that 
%   Xj*ctranspose(Xj) = ( Re(Xj)*transpose(Re(Xj)) +
%   Im(Xj)*transpose(Im(Xj)) ) + i * ( Im(Xj)*transpose(Re(Xj)) - Re(Xj)*transpose(Im(Xj)))
%
% Input:
%   
%   X      : [d1d2 x d1d2 x 2] double - optimization variable
%   Jr     : [d1d2 x d1d2] double - real part of Choi matrix
%   Ji     : [d1d2 x d1d2] double - imaginary part of Choi matrix  
%   d1     : int - input dimension
%   d2     : int - output dimension
%
% Output:
%
%   obj    : double - 
%   grad   : [d1d2 x d1d2 x 2] double - value of gradient
%


%% Compute decomposition difference Diffr and Diffi

d = d1*d2;

Temp = zeros(d,d,2);

for j  = 1: d2 

    indexLeft  = (j-1)*d1 +1;
    indexRight = j*d1;

    %% Range over d1-wide columns

    % real part
    Temp(:,:,1) = Temp(:,:,1) + X(:,indexLeft:indexRight,1)*X(:,indexLeft:indexRight,1)' + X(:,indexLeft:indexRight,2)*X(:,indexLeft:indexRight,2)';

    % imaginary part
    Temp(:,:,2) = Temp(:,:,2) + X(:,indexLeft:indexRight,2)*X(:,indexLeft:indexRight,1)' - X(:,indexLeft:indexRight,1)*X(:,indexLeft:indexRight,2)';

end

Diffr = Jr - Temp(:,:,1)/d2;

Diffi = Ji - Temp(:,:,2)/d2;


%% Compute objective

obj = norm(Diffr,"fro")^2 + norm(Diffi,"fro")^2;


%% Compute gradient

grad =  zeros(d,d,2);

DiffiCut = Diffi;
DiffiCut( (d+1)*(0:(d-1))+1 ) = 0; % Set diagonals to zero

% Vectorized version of gradient formula (non-trivial) 

grad(:,:,1) = -4/d2 * Diffr * X(:,:,1) + 4/d2 * DiffiCut * X(:,:,2);

grad(:,:,2) = -4/d2 * Diffr * X(:,:,2) - 4/d2 * DiffiCut * X(:,:,1); 


end

