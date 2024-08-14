% twirl2   How much a state changes under unitaries of the form mkron(U,U,U,...)
%   twirl2(rho) gives the maximal difference between the original state,
%   rho and the state obtained from it by a unitary of the form
%   mkron(U,U,U,...), where U is a single qubit unitary.
%   The difference is computed through the norm 
%   ||A||=sum_kl |A_kl|^2. The difference 
%   is zero for Werner states. The form twirl(rho,d) makes it
%   possible to twirl a register of qudits with dimension d. 
%   Using the form twirl(rho,d,Nit) we can determine how many random
%   unitaries are used for twirling. The default value for Nit is 100.
%   The form  [difference,U0]=twirl2(rho) gives also back
%   the unitary U0 for which the difference is the largest
%   between the original and the rotated state.

% Copyright (C) 2005  Geza Toth    E.mail: toth@alumni.nd.edu
%
% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU General Public License
% as published by the Free Software Foundation; see gpl.txt
% of this subroutine package.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 51 Franklin Street, Fifth Floor, 
% Boston, MA  02110-1301, USA.

function [difference,U0]=twirl2(rho,varargin);

if length(varargin)==0,
    % Dimension of quidits
    d=2;
    % Number of random unitaries used
    Nit=100;
elseif length(varargin)==1,
    d=varargin{1};
    Nit=100;
elseif length(varargin)==2,
    d=varargin{1};   
    Nit=varargin{2};
else
    error('Wrong number of input arguments');
end %if
   
x=[0 1;1 0];
z=[1 0;0 -1];
y=i*x*z;

[sy,sx]=size(rho);
N=log2(sx)/log2(d); 

difference=0;
U=zeros(d,d);
for n=1:Nit     
    
    % Create a random dxd unitary
    % from d orthogonal vectors
    for k=1:d
        vv=randn(d,1)+i*randn(d,1); 
        for m=1:k-1
            vv=vv-U(:,m)*(U(:,m)'*vv);
        end %for
        U(:,k)=vv/sqrt(vv'*vv);
    end %for 
    
    UU=U;
    for n=2:N
        UU=kron(UU,U);   
    end %for
    r=UU*rho*UU';
    % real() is important since MATLAB gives results with small
    % imaginary part; this spoils the use of > and <
    dd=real(trace((r-rho)*(r-rho)'));
    if dd>difference,
        difference=dd;
        U0=U;
    end %if
end %for




