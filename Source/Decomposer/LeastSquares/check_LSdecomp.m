function [isFound, error] = check_LSdecomp(Decom, fval, tol)
%
% isFound = check_LSdecomp(Decom, fval, tol, options)
%
%   Check if decomposition is correct up to tolerance tol
%
% Input:
%
%   Decom        : [ 1 x d2 ] cell array - containing the complex Choi matrices
%   X      : [d1d2 x d1d2 x 2] double - optimization variable
%   fval         : double - last objective evaluation 
%   tol          : double - tolerance of decomposition
%
% Output:
%
%   isFound      : logical - true iff decomposition is tol-correct
%

global Jrg Jig d2g

%% Check decomposition error

Diff = complex(Jrg, Jig);

for j = 1:d2g
    Diff =  Diff - 1/d2g * Decom{j};
end

error = sqrt(abs(fval));

isFound = error < tol;