function isBound = check_upperBoundOpNormRand(d, tol, t, conf, nTiles)
%
% isBound = check_upperBoundOpNormRand(t, tol, conf)
%
%   Check whether t is an upper bound for P( norm(V-I) <= tol^2 ) with
%   confidence conf.
%
% Input:
%
%   d      : int - dimension of sampled unitary matrices
%   tol    : double - tolerance distance to counter example
%   t      : double - upper bound to be checked
%   conf   : double - confidence of estimation
%   nTiles : int - number of tiles for par comp
%


%% Get sample complexity for estimation

n = min( [ ceil(log((1-conf)/2)/(-2*t^2)) , ceil( 2*(1 - conf)/t^2) ]);

fprintf('Sample complexity of estimation: %d \n', n);


%% Check for OpNormRandIso samples that are tol^2 close

tileSize =  ceil(n / nTiles);

parfor i = 1 : nTiles


    for j = 1 : tileSize  

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
    
        % Calculate difference
    
        U(1:d,:) = U(1:d,:) - eye(d);
    
    
        % Check
    
        if norm(U) <= tol^2
            error('tol^2 - close isometry found.');
        end

    end

    fprintf('Progress: %d \n', i/nTiles);

end

fprintf('%d is an upper bound for P( || Phi - Phi_c || <= tol) \n', t);

isBound = true;


end