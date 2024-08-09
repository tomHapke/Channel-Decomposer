function [c,ceq] = constraintLeastSquares(X,d2,d1)
%
% ceq = objectiveLeastSquares(X,d2,d1)
%
%   Constraint function for LeastSquare problem.
%
%
% Input:
%   
%   X      : [d1d2 x d1d2 x 2] double - optimization variable
%   d1     : int - input dimension
%   d2     : int - output dimension
%
% Output:
%
%   c      : [] - inequality constraints (empty)
%   ceq    : [d1 x d1d2 x 2] doubledouble - ceq of constraint
%

c = [];

d = d1*d2;

ceq = zeros(d1,d,2);

for j  = 1 : d2 

    indexLeftj  = (j-1)*d1 +1;
    indexRightj = j*d1;

    for i = 1:d2

        indexLefti  = (i-1)*d1 +1;
        indexRighti = i*d1;

        ceq(:,indexLeftj:indexRightj,1) = ceq(:,indexLeftj:indexRightj,1) ...
            + X(indexLefti:indexRighti ,indexLeftj:indexRightj, 1)*X(indexLefti:indexRighti ,indexLeftj:indexRightj, 1)' ...
            + X(indexLefti:indexRighti ,indexLeftj:indexRightj, 2)*X(indexLefti:indexRighti ,indexLeftj:indexRightj, 2)';

        ceq(:,indexLeftj:indexRightj,2) = ceq(:,indexLeftj:indexRightj,2) ...
            + X(indexLefti:indexRighti ,indexLeftj:indexRightj, 2)*X(indexLefti:indexRighti ,indexLeftj:indexRightj, 1)' ...
            - X(indexLefti:indexRighti ,indexLeftj:indexRightj, 1)*X(indexLefti:indexRighti ,indexLeftj:indexRightj, 2)';

    end
    
    ceq(:,indexLeftj:indexRightj,1) = ceq(:,indexLeftj:indexRightj,1) - eye(d1); 

end

end