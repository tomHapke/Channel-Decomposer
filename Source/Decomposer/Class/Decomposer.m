%% Superclass for decomposition solvers
%

classdef Decomposer

    methods (Abstract)
        % Every instance has a specified decompose-function

        [isFound, Decomp, error] = decompose(varargin)

    end

    methods 

        function [isFound, error] = decompose_rand(obj, d1, d2, choiRank, nSample, tol, options)
            %
            % [isFound, error] = decompose_rand(obj, d1, d2, choiRank, nSample, tol, options)
            %
            %   Decompose nSample-many random channels and return the
            %   result.
            %
            % Input:
            %
            %   d1         : int - input dimension
            %   d2         : int - output dimension
            %   choiRank   : int - rank of random channels (set to d1*d2 to sample over a dense subset of all channels)
            %   nSample    : int - number of samples
            %   tol        : double - tolerance of decomposition
            %   options    : struct - options for decomposing alogrithmn
            %
            % Output:
            %
            %   isFound     : [1,nSample] logical - true iff tol-decomposition is found
            %   error       : [1,nSample] double double - return true decomposition error
            %

            %% Check input
            
            assert(choiRank <= d1*d2 && choiRank >= 1, 'Invalid Choi-rank!');
            

            %% Init variables which report the result 

            isFound = false(1, nSample);
            error = zeros(1,nSample);


            %% Loop over samples and decompose

            for i = 1 : nSample

                % Get random CPTP
                A = rCPTPKraus(d1, d2, choiRank);

                % Kraus rep to Choi rep
                J = kraus2choiV2(A, choiRank, d1, d2);

                % Decompose
                [isFound(i), ~, error(i)] = obj.decompose(J, d1, tol, options);

            end

            
        end
    
        function Results = decompose_analysis(obj, d1, d2, choiRank, nSample, tol, options)
            %
            % Results = decompose_analysis(obj, d1, d2, choiRank, nSample, tol, options)
            %
            %   Decompose nSample-many random channels and return the
            %   result. On top of that, it measures the run-time and
            %   and prints a summary.
            %
            % Input:
            %
            %   d1         : int - input dimension
            %   d2         : int - output dimension
            %   choiRank   : int - rank of random channels (set to d1*d2 to sample over a dense subset of all channels)
            %   nSample    : int - number of samples
            %   tol        : double - tolerance of decomposition
            %   options    : struct - options for decomposing alogrithmn
            %
            % Output:
            %
            %   Result     : table - reports the decomposition runs
            %

            %% Check input
            
            assert(choiRank <= d1*d2 && choiRank >= 1, 'Invalid Choi-rank!');


            %% Init variables which report the result 

            Sample = (1 : nSample)';
            IsFound = false(nSample, 1);
            Error = zeros(nSample, 1);
            Duration = zeros(nSample, 1);


            %% Init waitbar

            wb = waitbar(0,'Please wait...');


            %% Loop over samples and decompose

            for i = 1 : nSample

                % Update waitbar
                if ishghandle(wb) % User might close waitbar
                    waitbar(i/nSample,wb,sprintf('Decompose CPTP map samples: %d out of %d',i, nSample));  
                end

                % Get random CPTP
                A = rCPTPKraus(d1, d2, choiRank);

                % Kraus 2 Choi
                J = kraus2choiV2(A, choiRank, d1, d2);
        
                % Decompose

                tic;

                [IsFound(i), ~, Error(i)] = obj.decompose(J, d1, tol, options);

                Duration(i) = toc;

            end

            Results = table(Sample, IsFound, Error, Duration);


            %% Print summary
            
            disp('---------------------');
            fprintf('Summary of %d samples:\n', nSample);
            fprintf('Percentage of successfull decompostions: %0.8f %% \n', mean(IsFound)*100);
            fprintf('Average error: %d \n', mean(Error));
            fprintf('Average duration: %d sec \n', mean(Duration));


            %% Close waitbar window

            close(wb);


        end

    end

end