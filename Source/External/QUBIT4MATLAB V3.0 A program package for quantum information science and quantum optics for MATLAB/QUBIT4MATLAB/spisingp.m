% spisingp   Hamiltonian for the Ising model with periodic boundary condition; sparse
%            version.
%   spisingp(B,N) gives the Hamiltonian as a sparse matrix for the 
%   ferromagnetic Ising model in transverse field for N qubits, if the 
%   field strength is B and the coefficient 
%   of the nearest neighbor coupling is 1. 
%   That is, the Hamiltonian is H= - sum_k z(k) z(k+1) + B*sum_k x(k), 
%   where x and z denote Pauli spin matrices.
%   The coupling is z-z and the direction of the field is x. 
%   For the Hamiltonian periodic boundary condition is used.
%   If argument n is omitted then the default
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

function H=spisingp(BField,varargin)

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
H=-spnnchainp(z,z,N)+BField*spnnchainp(x,e,N);
 


