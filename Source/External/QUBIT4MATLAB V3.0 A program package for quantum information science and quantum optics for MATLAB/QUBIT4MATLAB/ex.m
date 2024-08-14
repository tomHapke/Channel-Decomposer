% ex  Expectation value of an operator
%    ex(op,rho) is the expectation value of the operator op
%    for the density matrix rho.  If rho is not normalized,
%    it is automatically normalized to have trace 1.
%    If instead of rho a state vector is given then it is 
%    automatically converted to a normalized density matrix.

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

function e=ex(op,rho)
   if min(size(rho))==1,
       % Input is a state vector
       e=bra(rho)*op*ket(rho);
   else
       % Input is a density matrix
       e=trace(rho*op)/trace(rho);
   end %if