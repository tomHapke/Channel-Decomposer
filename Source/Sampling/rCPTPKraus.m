function A = rCPTPKraus(d1, d2, m)
%
% A = rCPTPKraus(d1, d2, m)
%
%   Sample random CPTP map by sampling a random unitary (Haar measured), but without computing the
%   whole unitary. 
%
%   CREDITS: 
%   The code is inspired by the function 'runitary' from the
%   external QUBIT4MATLAB package:
%
%   Program title: QUBIT4MATLAB V3.0
%   Catalogue identifier: AEAZ_v1_0
%   Program summary URL: http://cpc.cs.qub.ac.uk/summaries/AEAZ_v1_0.html
%   Program obtainable from: CPC Program Library, Queen%s University, Belfast, N. Ireland
%   Licensing provisions: Standard CPC licence, http://cpc.cs.qub.ac.uk/licence/licence.html
%
% Input:
%
%   d1   : int  - input dim
%   d2   : int  - output dim
%   m    : int  - number of Kraus Operators
%
% Output:
%
%   A    : [d2 x d1 x m] complex - contains complex Kraus ensemble
%

d = m * d2;
U=zeros(d, d1);

% Create (first d1 columns of) a random  unitary
for k=1:d1
    vv=randn(d,1)+1i*randn(d,1); 
    for j=1:k-1
        vv=vv-U(:,j)*(U(:,j)'*vv);
    end %for
    U(:,k)=vv/sqrt(vv'*vv);
end %for 


%% Set Kraus Operators

A = zeros(d2, d1, m);

for j = 1:m
    A(:,:,j) = U( (d2*(j-1)+1):(d2*j) ,:);
end


