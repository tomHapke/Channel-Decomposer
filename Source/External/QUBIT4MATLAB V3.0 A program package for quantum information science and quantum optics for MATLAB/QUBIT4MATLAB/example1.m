% example1   Example script for demonstrating the use of QUBIT4MATLAB. 

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
% *  A single two-state state system  *
% *                                   *
% *************************************

% Define a state vector corresponding to |0>
phi0=ket([1 0])

% Define a state vector corresponding to |1>
phi1=ket([0 1])

% Define a state vector corresponding to (|0>+|1>)/sqrt(2)
phi01=ket([1 1])

% Density matrix corresponding to a state vector
rho=ketbra(phi01)

echo off
