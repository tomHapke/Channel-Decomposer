% example3   Example script for demonstrating the use of QUBIT4MATLAB. 

% Copyright (C) 2005  Geza Toth    E.mail: toth@alumni.nd.edu
%
% This program is free software; you can redistribute it and/or1
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

echo on

% *************************************
% *                                   *
% *    Operators for spin chains      *
% *                                   *
% *************************************

% Define Pauli spin matrices x,y,z and e
paulixyz

% Define Heisenberg interaction for two qubits
H_H=kron(x,x)+kron(y,y)+kron(z,z)

% Print out the decomposition of H_H
decompose(H_H)

% Print out the decomposition of H_H in LaTeX format
decompose(H_H,1)

% Define a spin chain Hamiltonian 
% with Heisenberg interaction
% periodic boundary condition, 8 qubits
% Compute ground state energy.
H_Hp=nnchainp(x,x,8)+nnchainp(y,y,8)+nnchainp(z,z,8);
ground_state_energy=min(real(eig(H_Hp)))

% Define a similar Hamiltonian, but not with a periodic
% boundary condition
H_H=nnchain(x,x,8)+nnchain(y,y,8)+nnchain(z,z,8);
ground_state_energy=min(real(eig(H_H)))

% Define an operator acting on the 3rd and 4th qubit in a 
% 5-qubit chain
Op=twoquditop(kron(x,x)+kron(y,y)+kron(z,z),3,4,5);

% Print out the decompostion of Op
decompose(Op)

echo off