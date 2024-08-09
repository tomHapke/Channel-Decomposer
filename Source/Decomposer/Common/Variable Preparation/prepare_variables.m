function [x0,A,b,Aeq,beq,lb,ub] = prepare_variables(d2, d1, options)
%
% [x0,A,b,Aeq,beq,lb,ub] = prepare_variables(d2,d1)
%
%   Prepare variables for fmincon
%
% Input:
%
%   J            : [d1d2 x d1d2] complex - Choi Jamiolkowski matrix to decompose
%   d1           : int - input dimension
%   d2           : int - output dimension
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

    
%% Linear constraints (empty)

A = [];
b = [];

Aeq = [];
beq = [];

lb = [];
ub = [];


%% Intial value

if isfield(options, 'initialValueMode')
    switch options.initialValueMode
        case 'depolDecomp'
            x0 = get_depolDecomp(d1,d2);
        case 'random'
            x0 = get_randomInitialValue(d1,d2);
        case 'ensembleRandom'
            x0 = get_ensembleRandomInitialValue(d1,d2);
        otherwise
            error('Invalid intialValueMode!')
    end
else
    x0 = get_depolDecomp(d1,d2);  % Default
end

end