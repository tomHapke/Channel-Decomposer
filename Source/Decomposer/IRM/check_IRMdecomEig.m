function [isDefinite, maxEigBound] = check_IRMdecomEig(Decom, options)
%
% [isDefinite, maxEigBound] = check_IRMdecomEig(Decom, options)
%
%   Check eigenvalues of decomposing Choi matrices obtained by IRM
%   algorithm
%
% Input:
%
%   Decom        : [ 1 x d2 ] cell array - containing the complex Choi matrices
%   options : struct - set various options
%
% Output:
%
%   isDefinite   : logical - true iff decomposition is PSD
%   maxEigBound  : double - maximal (d1+1) eigenvalue out of all Choi matrices
%

%% Init variables

global d1g d2g

maxEigBound = -1;
isDefinite = true;

if isfield(options,'tolPSD')
    tolPSD = options.tolPSD;
else
    tolPSD = 1e-8; %Default
end


%% Check spectra

for i = 1:d2g
    spec = sort(eig(Decom{i}),'descend');

    if spec(end) < -tolPSD
        isDefinite = false;
    end

    e = spec(d1g+1);

    if e > maxEigBound
        maxEigBound = e;
    end

end





