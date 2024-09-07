function Diff = get_decomDiff(J,C)
%
% Diff = get_decomDiff(J,C)
%
%   Get decomposition difference.
%
% Input:
%
%   J       : [d1d2 x d1d2] complex - Choi Jamiolkowski matrix to decompose
%   C       : [1 xd2] cell - contains Choi matrices of decomposition
%
% Output:
%
%   Diff    : [d1d2 x d1d2] complex - decomposition difference 
%      

%% Init variables

global d2g

Diff = -J;


%% Compote difference

for i = 1:d2g
    Diff = Diff + 1/d2g*C{i};
end
