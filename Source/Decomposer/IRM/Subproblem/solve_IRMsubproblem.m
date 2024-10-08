function [enew, Cnew] =solve_IRMsubproblem(J,U,e0,C0,options)
%
% [enew, Cnew] =solve_IRMsubproblem(J,U,e0,C0)
%
%   Solve IRM subproblem.
%
% Input:
%
%   J       : [d1d2 x d1d2] complex - Choi Jamiolkowski matrix to decompose
%   U       : [d1d2 x d1(d2-1) x d2] complex - contains eigenvectors 
%   e0      : double - feasible (d1+1)-eigenvalue bound 
%   C0      : [1 xd2] cell - contains Choi matrices of feasible decomposition
%   options : struct - set various options
%
% Output:
%
%   enew    : double - optimal (d1+1)-eigenvalue bound 
%   Cnew    : [1 xd2] cell - contains Choi matrices of optimal decomposition
%


%% Define variables and assign initial value (optimum from previous subproblem)

yalmip('clear')

global d1g d2g

d = d1g*d2g;
dm = d1g*(d2g-1);

C = cell(1,d2g);

for i=1:d2g
    C{i} = sdpvar(d, d, 'hermitian', 'complex');
    assign(C{i},C0{i});
end

e = sdpvar(1,1);
assign(e,e0);


%% Define constraints 

% Decomposition constraint

Constraints = [ get_decomDiff(J,C) == 0 ];

% Partial trace constraint

for i = 1 : d2g
    Constraints = [Constraints, Try(C{i}) == eye(d1g) ];
end

% PSD constraint

for i = 1 : d2g
    Constraints = [Constraints,  C{i} >=0 ];
end

% Relaxed low rank constraint 

for i = 1 : d2g
    Constraints = [Constraints, e*eye(dm) - (U(:,:,i)')*C{i}*U(:,:,i) >= 0 ];
end

% Lower bound on e

Constraints = [Constraints, e >=0 ];


%% Define objective

Objective = e;


%% Set some options for YALMIP and solver

optionsSDP = set_IRMoptions(options);


%% Solve the problem

optimize(Constraints, Objective, optionsSDP);


%% Set solution

enew = value(e);

Cnew = cell(1,d2g); 

for i = 1:d2g
    Cnew{i} = value(C{i});
end

