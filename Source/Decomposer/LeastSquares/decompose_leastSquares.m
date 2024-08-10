function [isFound, Decom, error] = decompose_leastSquares(varargin)
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


%% Prepare variables

disp('Prepare optimization problem ...');

[x0,A,b,Aeq,beq,lb,ub] = prepare_variables(options);


%% Objective (and gradient if option is set)

fun = get_objectiveLeastSquare(options);


%% Constraints (and gradient if option is set)

nonlcon = get_constraintLeastSquare(options);


%% options for fmincon

optionsFmincon = optimoptions('fmincon','Display','iter','SpecifyObjectiveGradient',true,'SpecifyConstraintGradient',true);


if isfield(options,'Algorithm')
    optionsFmincon = optimoptions(optionsFmincon,'Algorithm',options.Algorithm);
end

if isfield(options,'includeObjectiveGradient') && ~options.includeObjectiveGradient
    optionsFmincon = optimoptions(optionsFmincon,'SpecifyObjectiveGradient',false);
end

if isfield(options,'includeConstraintGradient') && ~options.includeConstraintGradient 
    optionsFmincon = optimoptions(optionsFmincon,'SpecifyConstraintGradient',false);
end

if isfield(options,'CheckGradients') && options.CheckGradients
    optionsFmincon = optimoptions(optionsFmincon,'CheckGradients',true);
end

if isfield(options,'MaxFunctionEvaluations')
    optionsFmincon = optimoptions(optionsFmincon,'MaxFunctionEvaluations',options.MaxFunctionEvaluations);
end

if isfield(options,'MaxIterations') 
    optionsFmincon = optimoptions(optionsFmincon,'MaxIterations',options.MaxIterations);
end


%% Execute fmincon

disp('Decompose Channel: run fmincon ...')

[X, fval] = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,optionsFmincon);


%% Transform X to Cell array of Choi matrices

Decom = transform_x2Decom(X);


%% check decomp with tol and set isFound

[isFound, error] = check_decomp(Decom, fval, tol, options);


%% Clear global variables

clear Jrg Jig d1g d2g



end