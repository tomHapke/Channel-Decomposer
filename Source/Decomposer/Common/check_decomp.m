function [isFound, error] = check_decomp(J, Decom, tol)
%
% [isFound, error] = check_decomp(J, Decom, tol)
%
%   Check decomposition error w.r.t. ||*||_J  
%
% Input:
%
%   J       : [d1d2 x d1d2] complex - Choi Jamiolkowski matrix to decompose
%   Decom        : [ 1 x d2 ] cell array - containing the complex Choi matrices
%   tol          : double - tolerance of decomposition
%
% Output:
%
%   isFound      : logical - true iff decomposition is tol-correct
%

global d1g d2g

%% Compute ||*||_J decomposition error

Diff = J;

for j = 1:d2g
    Diff =  Diff - 1/d2g * Decom{j};
end

error = sum(abs(eig(Diff)))/d1g;


%% Check if found

isFound = error <= tol;