function [c,ceq] = constraintLeastSquares(X)
%
% [c,ceq] = objectiveLeastSquares(X)
%
%   Constraint function for LeastSquare problem.
%   Also known as Partial Trace constraint.
%
%
% Input:
%   
%   X      : [d1d2 x d1d2 x 2] double - optimization variable
%
% Output:
%
%   c      : [] - inequality constraints (empty)
%   ceq    : [d1 x d1d2 x 2] doubledouble - ceq of constraint
%

global d1g d2g   

c = [];

d = d1g*d2g;

ceq = zeros(d1g,d,2);

for j  = 1 : d2g 

    indexLeftj  = (j-1)*d1g +1;
    indexRightj = j*d1g;

    for i = 1:d2g

        indexLefti  = (i-1)*d1g +1;
        indexRighti = i*d1g;

        ceq(:,indexLeftj:indexRightj,1) = ceq(:,indexLeftj:indexRightj,1) ...
            + X(indexLefti:indexRighti ,indexLeftj:indexRightj, 1)*X(indexLefti:indexRighti ,indexLeftj:indexRightj, 1)' ...
            + X(indexLefti:indexRighti ,indexLeftj:indexRightj, 2)*X(indexLefti:indexRighti ,indexLeftj:indexRightj, 2)';

        ceq(:,indexLeftj:indexRightj,2) = ceq(:,indexLeftj:indexRightj,2) ...
            + X(indexLefti:indexRighti ,indexLeftj:indexRightj, 2)*X(indexLefti:indexRighti ,indexLeftj:indexRightj, 1)' ...
            - X(indexLefti:indexRighti ,indexLeftj:indexRightj, 1)*X(indexLefti:indexRighti ,indexLeftj:indexRightj, 2)';

    end
    
    ceq(:,indexLeftj:indexRightj,1) = ceq(:,indexLeftj:indexRightj,1) - eye(d1g); 

end

end