function [isFound, Decom, error] = decompose_IRM(varargin)
%
% [isFound, Decom, error] = decompose_IRM(varargin)
%
%   Solve decomposition problem by relaxing the rank contraint
%   by minimizig the (d1+1)-smallest eigenvalue iteravely.
%   For the SDP subproblem, we use the YALMIP interface (https://yalmip.github.io/)
%   and the Mosek SDP solver (https://www.mosek.com/).
%
% Input:
%
%   J       : [d1d2 x d1d2] complex - Choi Jamiolkowski matrix to decompose
%   d1      : int - input dimension
%   tol     : double - tolerance of decomposition (optional)
%   options : struct - set various options (optional)
%
% Output:
%
%   isFound : logical - true iff decomposition found within tolerance
%   Decom   : [1 x d2] cell - contains decomposition matrices
%   error   : double - l2 decomposition error, norm specified in options
%


%% Check input

[tol, options]  = check_input(varargin);

input = varargin{1};
J = input{2};


%% Prepare variables

if isfield(options,'MaxIter')
    itermax = options.MaxIter;
else
    itermax = 1000;
end

if isfield(options,'emin')
    emin=options.emin;
else
    emin  = 0.01; % Default
end


%% Execute IRM algorithm

k=0;

[e, C, U] = get_IRMInital(J);

while k < itermax && e>emin

   [e, C] = solve_IRMsubproblem(J,U,e,C,options);

   % Get eigenvectors for next subproblem iteration
   U = get_IRMeigsIsometry(C);

   % Show progress to user
   fprintf('(d1+1)-eigenvalue bound: %d \n',e);

   k = k + 1;
end

Decom = C;

%% Optional: Cut off eigenvectors

if isfield(options,'EigCutOff') && options.EigCutOff
    Decom = cutoff_smallEigVec(Decom);
end


%% Check partial trace feasiblity 

isFeasible = check_feasibility(Decom, tol);


%% Check eigenvalues of Decom

[isDefinite, maxEigBound] = check_IRMdecomEig(Decom, options);

fprintf('Maximal (d1+1)-eigenvalue: %d \n',maxEigBound)


%% Check decomposition error with tolerance tol

[isFound, error] = check_decomp(J, Decom, tol);


%% Set isFound accordingly

if emin<maxEigBound
    isFound = false;
    warning('Minimal eigenvalue bound emin was not reached!')
end

if ~isDefinite
    isFound = false;
    warning('Decomposition Choi matrices are not definite!')
end

if ~isFeasible
    isFound = false;
    warning('Decomposition not feasible!')
end


%% Clear global variables

clear Jrg Jig d1g d2g


end


