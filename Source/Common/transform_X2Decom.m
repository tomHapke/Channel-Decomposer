function Decom = transform_X2Decom(X)
%
% Decom = transform_XtoDecom(X)
%
%   Transform X to Cell array of Choi matrices
%
% Input:
%
%   X     : [ d1d2 x d1d2 x 2 ] double - array containing the decomposition
%
%
% Output:
%
%   Decom : [ 1 x d2 ] cell array - containing the complex Choi matrices
%

global d1g d2g

Decom = cell(1,d2g);

for j = 1:d2g

    indexLeft  = (j-1) * d1g + 1;
    indexRight = j * d1g;
    colIndices = indexLeft : indexRight;

    Decom{j}   =  complex( X(:,colIndices,1)*X(:,colIndices,1)' + X(:,colIndices,2)*X(:,colIndices,2)' , ...
        X(:,colIndices,2)*X(:,colIndices,1)' - X(:,colIndices,1)*X(:,colIndices,2)');

end

end
