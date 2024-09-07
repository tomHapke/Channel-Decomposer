function optionsSDP = set_IRMoptions(options)
%
% optionsFmincon = set_IRMoptions(options)
%
%   Set options struct for YALMIP Optimize by reading options structre.
%
% Input:
%
%   options : struct - set various options
%
% Output:
%
%   optionsSDP : struct - set various options
%   

optionsSDP = sdpsettings('solver','mosek');


%% Set Solver (Make sure it is installed!)

if isfield(options,'Solver') 
    optionsSDP = sdpsettings(optionsSDP,'solver',options.Solver);
end


%% Set display options

if isfield(options,'Display') && strcmp(options.Display,'off')
    optionsSDP = sdpsettings(optionsSDP,'verbose',0);
else
    optionsSDP = sdpsettings(optionsSDP,'verbose',2);
end


%% Set warning options

if isfield(options,'Warning') && strcmp(options.Display,'on')
    optionsSDP = sdpsettings(optionsSDP,'warning',1);
else
    optionsSDP = sdpsettings(optionsSDP,'warning',0);
end