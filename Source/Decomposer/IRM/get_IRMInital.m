function  [e0, C0, U0] = get_IRMInital(J)
%
% [e0, C0, U0] = get_IRMInital(J)
%
%   Get initial value for the first IRM subproblem
%
% Input:
%
%   J       : [d1d2 x d1d2] complex - Choi Jamiolkowski matrix to decompose
%
% Output:
%
%   e0      : double - (d1+1)-eigenvalue bound 
%   C0      : [1 xd2] cell - contains Choi matrices of decomposition
%   U0      : [d1d2 x d1(d2-1) x d2] complex - contains eigenvectors 
%

%% Init variables

global d1g d2g

d = d1g*d2g;
dm = d1g*(d2g-1);

U0 = zeros(d,dm,d2g);
C0 = cell(1,d2g);


%% Get eigenvectors of J 

V = get_evs(J,d1g+1,d);

for i = 1 : d2g
    U0(:,:,i) = V;
    C0{i} = J;
end


%% Get (d1+1)-smallest eigenvalue of J 

d = eigs(J,d1g+1);
e0 = d(d1g+1);