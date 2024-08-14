function [tol, options] = check_input(input)
%
% [tol ,options] = check_input(varargins)
%
%   Check input for decomposition algorithms.
%
% Input:
%
%   input        : [ 1 x ?] cell array -  containing the inputs
%
% Output:
%
%   tol           : double - tolerance of decomposition
%   options       : struct - set various options
%


%% Set variables as global

global Jrg Jig d1g d2g


%% Transform input

input = input{1};

input = input(2:end);

l = length(input);


%% Check input

assert(l >= 2, "Not enoght input arguments!");  % User has to provide J and d1 at least

J = input{1};   % Define J

Jrg = real(J);
Jig = imag(J);

assert(size(J,1) == size(J,2), "Choi matrix is not quadratic!");

d1g = input{2}; 

assert(rem(size(J,1),d1g) == 0 , "Input dimension and Choi matrix dimensions don't match!");

d2g = size(J,1)/d1g;  % Set d2

assert( norm(J-ctranspose(J))<1e-10, "Choi matrix is not hermitian");

if l <= 3
    
    options = struct([]);
    
    if l == 2
        tol = 1e-6;
    else
        tol = input{3};
    end

else
    tol     = input{3};
    options = input{4};
end
   
end
