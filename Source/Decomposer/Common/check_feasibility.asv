function isFeasible = check_feasibility(Decom, tol)
%
% isFeasible = check_feasibility(Decom, tol)
%
%   Check feasibility error w.r.t. ||*||_J  
%
% Input:
%
%   Decom        : [ 1 x d2 ] cell array - containing the complex Choi matrices
%   tol          : double - tolerance of decomposition
%
% Output:
%
%   isFeasible   : logical - true iff decomposition is tol-feasible
%

%% Init variables

global d1g d2g

feasError = 0;


%% Compute feasibility error

for i = 1:d2g
    feasError = feasError + sum(abs(eig(Try(Decom{i})-eye(d1g))))/d1g;
end

feasError = feasError / (d2g);


%% Check feasbility error (trace preservability)

isFeasible = feasError <= tol;