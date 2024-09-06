function p = distfuncOpNormRandIso(n, d, x)
%
% p = distfuncOpNormRandIso(n, d, x)
%
%   Get value of the MaxEigenAngle distribution function of a haar-measured
%   unitary of dimension d at x. Use Toeplitz matrix ansatz.
%
% Input:
%
%   n    : int - sample size to estimate F(x)
%   d    : int - dimension of sampled unitary matrices
%   x    : double - position at which to evaluate
%
% Output:
%
%   p    : double - value of distribution function F(x)
%

s = 0;

for i = 1 : n

    % Get random isometry

    D = d^3;
    U=zeros(D, d);
    
    % Create (first d columns of) a random  unitary
    for k=1:d
        vv=randn(D,1)+1i*randn(D,1); 
        for j=1:k-1
            vv=vv-U(:,j)*(U(:,j)'*vv);
        end %for
        U(:,k)=vv/sqrt(vv'*vv);
    end %for 

    % Callculate difference

    U(1:d,:) = U(1:d,:) - eye(d);


    % Update estimate

    if norm(U) <= x
         s = s + 1;
    end

end

p = s/n;

end