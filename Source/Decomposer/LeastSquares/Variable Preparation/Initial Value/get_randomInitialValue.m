function x0 = get_randomInitialValue(d1,d2)
%
% x0 = get_randomInitialValue(d1,d2)
%
%   Get random initial value for channel decomposer
%
% Input:
%
%   d1      : int - input dimension
%   d2      : int - output dimension
%
% Output:
%
%   x0      : [d1d2 x d1d2 x 2] - inital value for fmincon execution
%

d = d1*d2;

x0 = zeros(d ,d, 2 );

for j = 1 : d2

    indexLeft = d1 * (j-1) + 1;
    indexRight = d1 * j;

    % Sample Random Generalized Extreme CPTP Map
    A = rCPTPKraus(d1, d2, d1);

    % Get Choi matrix
    J = kraus2choiV2(A, d1, d1, d2);

    % Compute column representation
    [V,D] = eig(J);
    [ev,ind] = sort(diag(D),'descend');
    X =  V(:,ind(1:d1)) .* sqrt(ev(1:d1)'); 

    % Set x0
    x0(:,indexLeft:indexRight,1) = real(X);
    x0(:,indexLeft:indexRight,2) = imag(X);

end