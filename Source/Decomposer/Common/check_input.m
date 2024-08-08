function [J, d1, d2, tol, options] = check_input(varargins)
%
% [J, d1, d2, tol ,options] = check_input(varargins)
%
%   Check input for decomposition algorithms.
%
% Input:
%
%   J            : [d1d2 x d1d2] complex - Choi Jamiolkowski matrix to decompose
%   d1           : int - input dimension
%   tol          : double - tolerance of decomposition (optional)
%   options      : struct - set various options (optional)
%
% Output:
%
%   J            : [d1d2 x d1d2] complex - Choi Jamiolkowski matrix to decompose
%   d1           : int - input dimension
%   d2           : int - output dimension
%   tol          : double - tolerance of decomposition
%   options      : struct - set various options
%


assert(nargin >= 2, "Not enoght input arguments!");  % User has to provide J and d1 at least

J = varargins{1};   % Define J

assert(size(J,1) == size(J,2), "Choi matrix is not quadratic!");

d1 = varargins{2}; 

assert(rem(size(J,1),d1) == 0 , "Input dimension and Choi matrix dimensions don't match!");

d2 = size(J,1)/d1;  % Set d2

assert( norm(J-ctranspose(J))<1e-10, "Choi matrix is not hermitian");

if nargin <= 3
    
    options = struct([]);
    
    if nargin == 2
        tol = 1e-10;
    else
        tol = varargins{3};
    end

else
    options = varargins{4};
end
   
end
