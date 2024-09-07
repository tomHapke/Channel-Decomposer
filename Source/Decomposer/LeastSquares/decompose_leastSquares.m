function [isFound, Decom, error] = decompose_leastSquares(varargin)
%
% [isFound, Decom, error] = decompose_leastSquares(varargin)
%
%   Minimize decompostion error in l2-norm. We represent 
%   the decomposing channels by d1*d2 x d1 columns in a d1*d2 x d1*d2 matrices
%   called X. The constraint guarantees trace preservability.
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


%% Check input and define global variables

[tol, options]  = check_input(varargin);

global d1g d2g

input = varargin{1};

J = input{2};


%% Prepare variables

if isfield(options,'Display') && ~strcmp(options.Display,'off')
    disp('Prepare optimization problem ...');
end

[x0,A,b,Aeq,beq,lb,ub] = prepare_LSvariables(options);

optionsFmincon = set_LSoptions(options, tol);


%% Objective (and gradient if option is set)

fun = get_objectiveLeastSquare(options);


%% Constraints (and gradient if option is set)

nonlcon = get_constraintLeastSquare(options);


%% Execute fmincon

if isfield(options,'Display') && ~strcmp(options.Display,'off')
    disp('Decompose Channel: run fmincon ...')
end

X = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,optionsFmincon);


%% Transform X to Cell array of Choi matrices

Decom = transform_X2Decom(X);


%% Check partial trace feasiblity 

isFeasible = check_feasibility(Decom, tol);


%% Check decomposition error with tolerance tol

[isFound, error] = check_decomp(J, Decom, tol);


%% Set isFound accordingly

if ~isFeasible
    isFound = false;
    warning('Decomposition not feasible!')
end


%% Clear global variables

clear Jrg Jig d1g d2g


end


