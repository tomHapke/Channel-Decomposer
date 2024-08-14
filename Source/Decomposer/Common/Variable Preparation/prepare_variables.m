function [x0,A,b,Aeq,beq,lb,ub] = prepare_variables(options)
%
% [x0,A,b,Aeq,beq,lb,ub] = prepare_variables(options)
%
%   Prepare variables for fmincon
%
% Input:
%

%   options      : struct - set various options
% 
% Output:
%
%   A            : empty - required to execute fmincon
%   b            : empty - required to execute fmincon
%   Aeq          : empty - required to execute fmincon
%   beq          : empty - required to execute fmincon
%   lb           : empty - required to execute fmincon
%   ub           : empty - required to execute fmincon
%   x0           : [d1d2 x d1d2 x 2] - inital value for fmincon execution
%

global d1g d2g    


%% Linear constraints (empty)

A = [];
b = [];

Aeq = [];
beq = [];

lb = [];
ub = [];


%% Intial value

if isfield(options, 'InitialValueMode')
    switch options.initialValueMode
        case 'depolDecomp'
            x0 = get_depolDecomp(d1g,d2g);
        case 'random'
            x0 = get_randomInitialValue(d1g,d2g);
        case 'ensembleRandom'
            x0 = get_ensembleRandomInitialValue(d1g,d2g);
        otherwise
            error('Invalid intialValueMode!')
    end
else
    x0 = get_depolDecomp(d1g,d2g);  % Default
end

end