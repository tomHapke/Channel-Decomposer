function [isFound, error] = check_decomp(Decom, X, fval, tol, options)
%
% isFound = check_decomp(Decom, fval, tol, options)
%
%   Check if decomposition is correct up to tolerance tol
%
% Input:
%
%   Decom        : [ 1 x d2 ] cell array - containing the complex Choi matrices
%   X      : [d1d2 x d1d2 x 2] double - optimization variable
%   fval         : double - last objective evaluation 
%   tol          : double - tolerance of decomposition
%   options      : struct - set various options (optional)
%
% Output:
%
%   isFound      : logical - true iff decomposition is tol-correct
%

global Jrg Jig d1g d2g

%% Check decomposition feasiblity 

if isfield(options, 'FeasbilityTol')
    feasTol = options.FeasbilityTol;
else
    feasTol = sqrt(d1g*d2g) * tol;
end

[~,ceq] = constraintLeastSquares(X);

if norm(ceq,'fro') > feasTol
    isFound = false;
    error = 0;
    warning('Decomposition not feasible!')
end


%% Check decomposition error

Diff = complex(Jrg, Jig);

for j = 1:d2g
    Diff =  Diff - 1/d2g * Decom{j};
end

if isfield(options, 'VerifyMethod') && strcmp(options.VerifyMethod,'trace')
    error = sum(abs(eig(Diff)))/d1g; 
else
    error = sqrt(abs(fval));
end

isFound = error < tol;