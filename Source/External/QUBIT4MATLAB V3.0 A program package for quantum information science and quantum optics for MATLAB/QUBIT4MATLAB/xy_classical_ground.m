% xy_classical_ground   Ground state energy of the classical xy model 
%   xy_classical_ground(Jx,Jy,B) gives the ground state energy per spin for 
%   the classical XY model in transverse field if the 
%   field strength is B and the coefficients of the xx and yy 
%   nearest neighbor coupling are Jx and Jy, respectively.
%   That is, the Hamiltonian is H= Jx*sum_k x(k) x(k+1) + 
%   Jy*sum_k y(k) y(k+1) + B*sum_k z(k), 
%   where x, y and z denote Pauli spin matrices.


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

function E0=xy_classical_ground(Jx,Jy,B)
% See G. Toth, Phys. Rev. A 71, 010301 (R) (2005).
M=max(abs(Jx),abs(Jy));
b=abs(B)/M;
if b>2,
    E0=-M*b;
else
    E0=-M*(1+b^2/4);
end %if

