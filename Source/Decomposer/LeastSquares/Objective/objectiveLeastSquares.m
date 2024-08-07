function value = objectiveLeastSquares(X,Jr,Ji,d2,d1)
%
% value = objectiveLeastSquares(X,Jr,Ji,d2,d1)
%
%   Objective function for LeastSquare problem.
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
%   value  : double - value of objective
%

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

value = norm(Jr-Temp(:,:,1)/d2,"fro")^2 + norm(Ji-Temp(:,:,2)/d2,"fro")^2;

end