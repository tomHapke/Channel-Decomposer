function [enew, Cnew] =solve_IRMsubproblem(J,U,e0,C0)


global d1g d2g

d = d1g*d2g;
dm = d1g*(d2g-1);

yalmip('clear')

%% Define variables

C = cell(1,d2g);

for i=1:d2g
    C{i} = sdpvar(d, d, 'hermitian', 'complex');
    assign(C{i},C0(:,:,i));
end

e = sdpvar(1,1);
assign(e,e0);






%% Define constraints 

% Lower bound on e

Constraints = [e >= 0];

% Decomposition constraint

Constraints = [Constraints, decom_sum(J,C) == 0];

% Partial trace constraint

%Constraints = [Constraints, Try(C) == id ];

% Relaxed low rank constraint and completely positiveness

for i = 1 : d2g
    Constraints = [Constraints, e*eye(dm) - (U(:,:,i)')*C{i}*U(:,:,i) >= 0, Try(C{i})==eye(d1g) , C{i} >=0 ];
end

%% Define objective

Objective = e;


%% Set some options for YALMIP and solver
options = sdpsettings('verbose',2,'solver','mosek');

%% Solve the problem
optimize(Constraints,Objective,options);

%% Set solutions

enew = value(e);

Cnew = zeros(d,d,d2g); 

for i = 1:d2g
    Cnew(:,:,i) = value(C{i});
end



end