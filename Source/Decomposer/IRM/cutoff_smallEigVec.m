function DecomNew = cutoff_smallEigVec(Decom)
%
% Decom = cutoff_smallEigVec(Decom);
%
%   Cut off the eigenvectors corresponding to small eigenvalues
%
% Input:
%
%   Decom   : [1 x d2] cell - contains decomposition matrices
%
% Output:
%
%   Decom   : [1 x d2] cell - contains decomposition matrices
%

%% Init variables

global d1g d2g

DecomNew = cell(1,d2g);

%% Compute eigenvectors

for i = 1:d2g

    [U,D] = eig(Decom{i});
    spec = diag(D,0);
    [spec,perm] = sort(spec,'descend');
    V     = U(:,perm);
    
    specnew = [ spec(1:(d1g)); zeros(d1g*(d2g-1),1) ];
    DecomNew{i} = V*diag(specnew)*(V');

end