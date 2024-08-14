% example2   Example script for demonstrating the use of QUBIT4MATLAB. 

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

echo on

% *************************************
% *                                   *
% *          Qubit register           *
% *                                   *
% *************************************

% Define the state (|00>+|11>)|1>/sqrt(2)
psi=ket([0 1 0 0 0 0 0 1])

% Print it out in a pretty form
printv(psi)

% Flip qubits 1 and 2
psi2=reorder(psi,[3 1 2])

% Print it out in a pretty form
printv(psi2)

% Reduced density matrix for psi for qubit 1
rho_red=keep(psi,1)

% The same using remove
rho_red=remove(psi,[3 2])

% Partial transpose according to the third qubit
rho_pt=pt(psi,3)

echo off
