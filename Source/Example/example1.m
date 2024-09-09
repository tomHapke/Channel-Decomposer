%% Executing LeastSquares solver
% Define dimensions
 d1 = 4;
 d2 = 4;
 choiRank = 16;

% Sample a random channel
A = rCPTPKraus(d1 , d2 , choiRank );
J = kraus2choiV2(A, choiRank , d1 , d2);

% Init solver instance
LS = LeastSquares();

% Execute decompose()
tol = 1e-6;
options.Display = 'iter';
options.StopCrit = 'FunVal';
options.OptimalityTolerance = 1e-8;

[ isFound , Decom , error ] = LS.decompose(J, d1 , tol , options );