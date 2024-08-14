% concurrence    Compute the concurrence of a two-qubit density matrix.

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

function c=concurrence(rho);
  y=[0 -i; +i 0];          
  R=rho*kron(y,y)*conj(rho)*kron(y,y);
  % Real is needed since MATLAB always adds a small imaginary part ...
  e=real(sqrt(eig(R)));
  e=-sort(-e);
  c=max(e(1)-e(2)-e(3)-e(4),0);