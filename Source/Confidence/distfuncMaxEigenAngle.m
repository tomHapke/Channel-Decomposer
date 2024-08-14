function p = distfuncMaxEigenAngle(d, x)
%
% p = distfuncMaxEigenAngle(x)
%
%   Get value of the MaxEigenAngle distribution function of a haar-measured
%   unitary of dimension d at x. Use Toeplitz matrix ansatz.
%
% Input:
%
%   d    : int - dimension of sampled unitary matrices
%   x    : double - position at which to evaluate
%
% Output:
%
%   p    : double - value of distribution function F(x)
%

%% Calculate fourier coefficients (all are real)

c = zeros(1,d);

c(1) =  x / pi;

c(2:end) = sin( x * (1:(d-1))) ./ ( pi * (1:(d-1)));


%% Calculate determinant of Toeplitz matrix

p = det(toeplitz(c));

end