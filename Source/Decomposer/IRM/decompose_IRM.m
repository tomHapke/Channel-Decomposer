function [isFound, Decom] = decompose_IRM(varargin)
%
% [isFound, Decom] = decompose_leastSquares(varargin)
%
%    
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
%   error   : double - decomposition error, norm specified in options
%


%% Check input

[tol, options]  = check_input(varargin);

input = varargin{1};

J = input{2};

%% Prepare variables


if isfield(options,'itermax')
    itermax = options.itermax;
else
    itermax = 1000;
end

if isfield(options,'emin')
    emin=options.emin;
else
    emin  = 0.01;
end


%% Objective (and gradient if option is set)


%% Constraints (and gradient if option is set)


%% Execute algorithm

k=0;

[e, C, U] = get_IRMInital(J);

while k < itermax && e>emin

   [e, C] = solve_IRMsubproblem(J,U,e,C);
    
   U = get_IRMeigsIsometry(C);

   fprintf('Epsilon bound: %d \n',e);
   k = k + 1;
end


%% check feasibility


%% check decomp with tol and set isFound

isFound = e<emin ;

Decom = C;

%% Clear global variables

clear Jrg Jig d1g d2g



end


