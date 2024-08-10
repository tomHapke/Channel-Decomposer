function [isFound, error] = check_decomp(Decom, fval, tol, options)
%
% isFound = check_decomp(Decom, fval, tol, options)
%
%   Check if decomposition is correct up to tolerance tol
%
% Input:
%
%   Decom        : [ 1 x d2 ] cell array - containing the complex Choi matrices
%   fval         : double - last objective evaluation 
%   tol          : double - tolerance of decomposition
%   options      : struct - set various options (optional)
%
% Output:
%
%   isFound      : logical - true iff decomposition is tol-correct
%

global Jrg Jig d2g

Diff = complex(Jrg, Jig);

for j = 1:d2g
    Diff =  Diff - 1/d2g * Decom{j};
end

if isfield(options, 'VerifyMethod') && strcmp(options.VerifyMethod,'fro')
    error = sqrt(abs(fval));
else
    error = sum(abs(eig(Diff)));   
end

isFound = error < tol;