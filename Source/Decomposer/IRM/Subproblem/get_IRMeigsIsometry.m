function U = get_IRMeigsIsometry(C)
%
% U = get_IRMeigsIsometry(C)
%
%   Get eigenvectors of Choi matrices of decomposition C
%
% Input:
%
%   C     : [1 xd2] cell - contains Choi matrices of decomposition
%
% Output:
%
%   U     : [d1d2 x d1(d2-1) x d2] complex - contains eigenvectors 
%   

%% Init variables

global d1g d2g

d = d1g*d2g;
dm = d1g*(d2g-1);

U = zeros(d,dm,d2g);


%% Compute eigenvectors

for i = 1 : d2g
    U(:,:,i) = get_evs(C{i},d1g+1,d);
end

