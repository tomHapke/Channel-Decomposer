% mrealign   Generalized realignment of a multipartite operator
%    mrealign(M,list) realigns matrix M (that can be a density matrix)
%    in a multipartite system where the qudits have dimension 2.
%    mrealign(M,list,d) makes it possible to have qudits
%    for d>2. 
%    Example for 2 qubits:
%       mrealign(M,[4 3 2 1]) - Noting changes
%       mrealign(M,[2 3 4 1]) - Partial transpose
%       mrealign(M,[4 2 3 1]) - Realignment

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

function rhoR=mrealign(rho,list,varargin)

% rho is should not be normalized
% thus we do not use: "rho=ketbra2(rho);"

if isempty(varargin),
   d=2;
else
    if length(varargin)~=1,
        error('Wrong number of input arguments.');
    end %if
    d=varargin{1};
end %if

[sx,sy]=size(rho);
N=floor(log(sx)/log(d)+0.5);

% Create a multidimensional matrix
r2=reshape(rho,kron(d,ones(1,2*N)));

% Permute the indices
% Nothing happens corresponds to [2N 2N-1 .... 3 2 1]
list2=2*N+1-list;
r3=permute(r2,list2);
  
rhoR=reshape(r3,d^N,d^N);
  