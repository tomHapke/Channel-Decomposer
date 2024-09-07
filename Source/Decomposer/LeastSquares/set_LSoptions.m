function optionsFmincon = set_LSoptions(options, tol)
%
% optionsFmincon = set_LSoptions(options)
%
%   Set options-instance for fmincon by reading options structre.
%
% Input:
%
%   options : struct - set various options
%   tol     : double - tolerance of decomposition 
%
% Output:
%
%   optionsFmincon : optim.options.Fmincon instance
%   


optionsFmincon = optimoptions('fmincon','Display','iter','SpecifyObjectiveGradient',true,'SpecifyConstraintGradient',true);


%% Choose Nonlinear solver

if isfield(options,'Algorithm')
    optionsFmincon = optimoptions(optionsFmincon,'Algorithm',options.Algorithm);
end


%% Set display options

if isfield(options,'Display')
    optionsFmincon = optimoptions(optionsFmincon,'Display',options.Display);
end


%% Decide whether to include the implemented objective gradient or not
%  Using the implemented objective gradient yields an enormous
%  run-time improvment

if isfield(options,'IncludeObjectiveGradient') && ~options.includeObjectiveGradient
    optionsFmincon = optimoptions(optionsFmincon,'SpecifyObjectiveGradient',false);
end


%% Set option whether to include the implemented constraint gradient or not
%  Using the implemented constraint gradient yields an enormous
%  run-time improvment

if isfield(options,'IncludeConstraintGradient') && ~options.includeConstraintGradient 
    optionsFmincon = optimoptions(optionsFmincon,'SpecifyConstraintGradient',false);
end


%% Compare implemented gradient and finite-difference approximation
%  This feature is mainly used to test the correct gradient implementation

if isfield(options,'CheckGradients') && options.CheckGradients
    optionsFmincon = optimoptions(optionsFmincon,'CheckGradients',true);
end


%% Set bound on function evalutation

if isfield(options,'MaxFunctionEvaluations')
    optionsFmincon = optimoptions(optionsFmincon,'MaxFunctionEvaluations',options.MaxFunctionEvaluations);
end


%% Set bound on number of iteration

if isfield(options,'MaxIterations') 
    optionsFmincon = optimoptions(optionsFmincon,'MaxIterations',options.MaxIterations);
end


%% Set a tolerance for first-order optimality (grad==0)

if isfield(options, 'OptimalityTolerance')
    optionsFmincon = optimoptions(optionsFmincon,'OptimalityTolerance',options.OptimalityTolerance);
end


%% Set stopping Criterion:  'Funval'- stop flag when objective value is small enough
%  By the Audenaurt-Ruskai conjecture, we assume that the optimal value is
%  0, hence this stopping criterion is reasonable.

if ~isfield(options,'StopCrit') || ( isfield(options,'StopCrit') && ~strcmp(options.StopCrit,'FunVal') )
    optionsFmincon = optimoptions(optionsFmincon,'OutputFcn',@outfun);
    global tolg
    tolg = tol;
end

end





%% Stop algorithmn when objective is tol-small enough (and tol-feasible)

function stop = outfun(x, optimValues, state)

global d1g d2g tolg

stop = false;

[~,ceq] = constraintLeastSquares(x);

if optimValues.fval < (d1g/d2g) * tolg^2 && norm(ceq,'fro') < sqrt(d1g*d2g) * tolg
    stop = true;
    disp('Optimization stopped because Channel decomposition error is tol-close enough to zero.')
end
    
end
