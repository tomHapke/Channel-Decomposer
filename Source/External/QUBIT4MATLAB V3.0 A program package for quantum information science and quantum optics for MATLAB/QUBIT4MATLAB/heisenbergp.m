% heisenbergp   Hamiltonian for the Heisenberg model with periodic BEC
%   heisenbergp(N) gives the Hamiltonian for the 
%   anti-ferromagnetic Heisenberg chain for N qubits, if the coefficient 
%   of the nearest neighbor coupling is 1.
%   For the Hamiltonian periodic boundary condition is used.
%   If argument N is omitted then the default
%   is taken to be the value of global variable N.

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

function H=heisenberg(varargin)

if isempty(varargin),
     global N;
else
    if length(varargin)~=1,
        error('Wrong number of input arguments.')
    end %if
    N=varargin{1};
end %if

   x=[0 1;1 0];
   y=[0 -i;i 0]; 
   z=[1 0; 0 -1];
   e=[1 0; 0 1];

   % Using routines from the library to make the Ising Hamiltonian
   H=nnchainp(z,z,N)+nnchainp(x,x,N)+nnchainp(y,y,N);
 


