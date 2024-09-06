%% Superclass for decomposition solvers
%

classdef Decomposer

    methods (Abstract)
        [isFound, Decomp, error] = decompose(varargin)
    end

    methods 

        function [isFound, error] = decompose_rand(obj, d1, d2, choiRank, nSample, tol, options)

            assert(choiRank <= d1*d2 && choiRank >= 1, 'Invalid Choi-rank!');
            
            isFound = false(1, nSample);
            error = zeros(1,nSample);

            for i = 1 : nSample

                % Get random CPTP
                A = rCPTPKraus(d1, d2, choiRank);

                % Kraus 2 Choi
                J = kraus2choiV2(A, choiRank, d1, d2);

                % Decompose
                [isFound(i), ~, error(i)] = obj.decompose(J, d1, tol, options);

            end
            
        end
    
        function Results         = decompose_analysis(obj, d1, d2, choiRank, nSample, tol, options)

            assert(choiRank <= d1*d2 && choiRank >= 1, 'Invalid Choi-rank!');

            Sample = (1 : nSample)';
            IsFound = false(nSample, 1);
            Error = zeros(nSample, 1);
            Duration = zeros(nSample, 1);

            wb = waitbar(0,'Please wait...');

            for i = 1 : nSample

                waitbar(i/nSample,wb,sprintf('Decompose CPTP map samples: %d out of %d',i, nSample));  

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

            disp('---------------------');
            fprintf('Summary of %d samples:\n', nSample);
            fprintf('Percentage of successfull decompostions: %0.8f %% \n', mean(IsFound)*100);
            fprintf('Average error: %d \n', mean(Error));
            fprintf('Average duration: %d sec \n', mean(Duration));

            close(wb);

        end

    end

end