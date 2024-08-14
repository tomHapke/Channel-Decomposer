% rproduct   Random product state vector for a given number of qubits.
%   rproduct(n,d) gives an n-qudit product of random single-qudit state vectors.
%   The dimension of the qudit is 2 (qubits). The distribution of single-qudit 
%   state vectors obtained this way is uniform over the sphere of unit vectors. 
%   If d is not given then it is assumed to be 2 (qubits).
%   If N is not given then it is taken to be equal to the global
%   variable N.

% Copyright (C) 2006  Geza Toth    E.mail: toth@alumni.nd.edu
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

function p=rproduct(varargin)

if isempty(varargin)
    global N;
    d=2;
elseif length(varargin)==1
    N=varargin{1};
    d=2;
elseif length(varargin)==2
    N=varargin{1};
    d=varargin{2};
else
    error('Wrong number of input arguments.')
end %if

% Before normalization, elements of the vector 
% have a normal distribution.
p=randn(d,1)+i*randn(d,1);
p=p/sqrt(p'*p);

for n=1:N-1
   s=randn(d,1)+i*randn(d,1);
   s=s/sqrt(s'*s);
   p=kron(p,s);
end %for
