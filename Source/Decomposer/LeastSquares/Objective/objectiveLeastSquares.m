function value = objectiveLeastSquares(X)
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
%   value  : double - value of objective
%

global Jrg Jig d1g d2g

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

value = norm(Jrg-Temp(:,:,1)/d2g,"fro")^2 + norm(Jig-Temp(:,:,2)/d2g,"fro")^2;

end