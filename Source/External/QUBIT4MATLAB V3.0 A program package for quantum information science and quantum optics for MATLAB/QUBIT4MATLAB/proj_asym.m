% proj_asym  Gives the projector to the antisymmetric subspace
%    proj_asym(n)  Gives the projector to the antisymmetric subspace
%    of n qubits. proj_asym(n,d) does the same for qudits with dimension d.
%    Only n=2 is implemented.

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

function P=proj_asym(N,varargin)

if isempty(varargin),
   d=2;
elseif length(varargin)==1,
   d=varargin{1};
else    
   error('Wrong number of input arguments.');
end %if

if N~=2,
   error('Only the two-qudit case is implemented.');
end %if

P=zeros(d^2,d^2);
for n=1:d
    for m=1:n-1
        v=zeros(d^2,1);
        v(n+(m-1)*d)=1;
        v(m+(n-1)*d)=-1;
        P=P+v*v'/2;   
    end %for
end %for
