function search_closeRandIso(d, tol, n, nTiles)

global numbSamples x_min nTilesg

nTilesg = nTiles;

x_min = 2;

q = parallel.pool.DataQueue;
listener = afterEach(q, @(x_min_tile) update_tileProgress(x_min_tile));

numbSamples = 0;

parfor i = 1 : n

    x = 0;
    x_min_tile = 2;

    for j = 1 : nTiles  

        % Get random isometry
    
        D = d^3;
        U=zeros(D, d);
        
        % Create (first d columns of) a random  unitary
        for k=1:d
            vv=randn(D,1)+1i*randn(D,1); 
            for m=1:k-1
                vv=vv-U(:,m)*(U(:,m)'*vv);
            end %for
            U(:,k)=vv/sqrt(vv'*vv);
        end %for 
    
        % Calculate difference
    
        U(1:d,:) = U(1:d,:) - eye(d);
    
    
        % Check

        x =  norm(U);
    
        if x <= tol/2
            error('tol/2 - close isometry found.');
        end

        if x < x_min_tile
            x_min_tile = x;
        end

    end

    send(q, x_min_tile);

end



end


function update_tileProgress(x_min_tile)

    global numbSamples x_min nTilesg
    

    if x_min_tile < x_min
        x_min = x_min_tile;
    end
    
    numbSamples = numbSamples + nTilesg;
    
    fprintf('Number of samples: %d \n', numbSamples);
    fprintf('Minimal sample value: %d \n', x_min);

end

