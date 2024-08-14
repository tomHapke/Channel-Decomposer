% va  Variance of an operator
%    va(op,rho) is the variance of the operator op
%    for the density matrix rho. If rho is not normalized,
%    it is automatically normalized to have trace 1.
%    If instead of rho a state vector is given then it is 
%    automatically converted to a normalized density matrix. 

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

function v=va(op,rho)
   if min(size(rho))==1,
       % Input is a state vector
       v=bra(rho)*op^2*ket(rho)-(bra(rho)*op*ket(rho))^2;
   else
       % Input is a density matrix
       v=trace(rho*op^2)/trace(rho)-trace(rho*op)^2/trace(rho)^2;
   end %if