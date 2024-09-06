function tol = get_tolerance(nEstimate, d, n, conf)



%%  Compute statisti

x = zeros(1,nEstimate);


for i = 1 : nEstimate

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

    x(i) = norm(U);
         
end

x = sort(x);

tol = 2* x( ceil( nEstimate*( 1 - nthroot( 1 - conf , n ) ) ) );


end