function N = get_sampleComplexity( d, tol, conf)
%
% N = get_sampleComplexity( tol, conf)
%
%   Compute the sample complexitiy for testing the
%   Ruskai-Audenaert-Conjecture with (tol,conf) - confidence.
%
% Input
%
%   d    : int - in- and output dimension    
%   tol  : double - diamond norm tolerance
%   conf : doulbe - confidence to test
%
% Output:
%
%   N    : int - sample complexity
%

%% Compute distfuncMaxEigenAngle at x =  2*arcsin(tol/4);

p = distfuncMaxEigenAngle(d^3, 2*asin(tol/4));


%% Compute complexity

N = ceil(log(conf) / log(1-p));



end