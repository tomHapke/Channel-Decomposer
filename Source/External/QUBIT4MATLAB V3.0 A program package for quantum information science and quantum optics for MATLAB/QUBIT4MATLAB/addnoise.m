% addnoise   Adds white noise to a density matrix.
%   addnoise(rho,p) computes the matrix 
%   rho'=(1-p)*rho+p*eye(M)/M where rho is an MxM matrix
%   If rho is a state vector then 
%   it is converted into a normalized density matrix.
%   If parameter d is omitted then it 
%   is taken to be 2 (qubits).

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

function rho_noisy=addnoise(rho,p)

% Convert state vector to density matrix if necessary
rho=ketbra2(rho);

% Obtain the size of the density matrix
[sx,sy]=size(rho);
rho_noisy=(1-p)*rho+p*eye(sx)/sx;