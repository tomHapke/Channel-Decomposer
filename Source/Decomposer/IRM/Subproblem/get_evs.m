function V = get_evs(C,a,b)
%
% V = get_evs(C,a,b)
%
%   Get eigenvectors of C corresponding to all
%   eigenvectors between the a-th largest and b-th largest eigenvalue.
%
% Input:
%
%   C     : [d1d2 x d1d2] complex - Choi matrix
%   a     : int - eigenvalue index
%   b     : int - eigenvalue index
%
% Output:
%
%   V     : [d1d2 x d1(d2-1)] complex - contains eigenvectors 
%   

%% Check input

assert(a<=b, 'b must not be smaller than a!')


%% Compute eigenvectors

[U,D] = eig(C);
[~,i] = sort(diag(D,0),'descend');
V     = U(:,i(a:b));

