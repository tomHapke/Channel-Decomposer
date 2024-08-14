function J = kraus2choiV2(A, m, d1, d2)
%
% J = kraus2choiV2(A, m, d1, d2)
%
%   Input complex tensor of complex kraus matrices and get Choi matrix.
%   Fast implementation with reshape command.
%   Performs in t ~ 0.009 s for [d1,d2,m] = [10,10,50];
%
% Input:
%   
%   A      : [d2 x d1 x m] complex - contains complex Kraus ensemble
%   m      : int - number of kraus matrices
%   d1     : int - input dimension
%   d2     : int - output dimension
%
% Output: 
%
%   J      : [d1d2 x d1d2] complex - Choi Jamiolkowski representation  
%

d = d1*d2;

J = complex(zeros(d),zeros(d));


for i1 = 1 : d1
    for i2 = 1 : d1
        Temp = zeros(d1);
        Temp(i1,i2) = 1;
        J = J + kron( reshape(A(:,i1,:),d2,m) * ctranspose( reshape(A(:,i2,:),d2,m) ) , Temp );
    end
end