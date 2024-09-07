function x0 = get_depolDecomp(d1,d2)
%
% x0 = get_depolDecomp(d1,d2)
%
%   Get decomposition of the completely depolarizing channel.
%
% Input:
%
%   d1           : int - input dimension
%   d2           : int - output dimension
%
% Output:
%
%   x0           : [d1d2 x d1d2 x 2] - inital value for fmincon execution
%

x0 = zeros( d1*d2, d1*d2, 2);  
x0(:,:,1) = eye(d1*d2);        % Real part


end