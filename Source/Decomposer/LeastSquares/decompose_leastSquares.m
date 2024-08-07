function [isFound, Decom] = decompose_leastSquares(varargin)
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
%


%% Check input

[J, d1, d2, tol, options] = check_input(varargins);


%% Prepare variables

disp('Prepare optimization problem ...');

[x0,A,b,Aeq,beq,lb,ub] = prepare_variables(d1, d2, options);


%% Objective (and gradient if option is set)

fun = get_objectiveLeastSquare(J,d2,d1,options);


%% Constraints (and gradient if option is set)

nonlcon = get_objectiveLeastSquare(J,d2,d1,options);

%% options for fmincon

optionsFmincon = optimoptions('fmincon','SpecifyObjectiveGradient',true,'SpecifyConstraintGradient',true);

if isfield(options,'Algorithm')
    optionsFmincon.Algorithm = options.Algorithm;
end

if isfield(options,'includeObjectiveGradient') && ~options.includeObjectiveGradient
    optionsFmincon.SpecifyObjectiveGradient = false;
end

if isfield(options,'includeConstraintGradient') && ~options.includeConstraintGradient 
    optionsFmincon.SpecifyConstraintGradient = false;
end

% see other options ... TODO


%% Execute fmincon



%% check decomp with tol and set isFound



end