% ising_classical_ground   Ground state energy of the classical Ising model 
%   ising_classical_ground(B) gives the ground state energy per spin for 
%   the classical Ising model in transverse field if the 
%   field strength is B and the coefficient 
%   of the nearest neighbor coupling is 1.
%   That is, the Hamiltonian is H= - sum_k z(k) z(k+1) + B*sum_k x(k), 
%   where x and z denote Pauli spin matrices.


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

function E0=ising_classical_ground(B)
% See G. Toth, Phys. Rev. A 71, 010301 (R) (2005).
if abs(B)>2,
    E0=-B;
else
    E0=-(1+B^2/4);
end %if

