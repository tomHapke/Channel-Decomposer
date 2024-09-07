function val = Try(C)
%
% val = Try(C)
%
%   Get Y-partial trace. Global d1 and d2 has to be set.
%
% Input:
%
%   C     : [d1d2 x d1d2] complex - Choi matrix
%
% Output:
%
%   val   : [d1 x d1] complex - value of partial trace 
%      

%% Init variables

global d1g d2g

val=zeros(d1g,d1g);


%% Compute partial trace

for i=1:d2g
    indexStart = d1g*(i-1)+1;
    indexEnd   = d1g*i;
    val        = val + C(indexStart:indexEnd,indexStart:indexEnd);
end
