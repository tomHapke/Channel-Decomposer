% ising_free - Free energy of the Ising model in thermal equilibrium
%   ising_free(B,T) gives the free energy of 
%   Ising model in transverse field in the
%   thermodynamic limit, if the temperature is T, the  
%   field strength is B and the coefficient 
%   of the nearest neighbor coupling is 1.

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

function F=ising_free(BField,T)

J=4;
Gamma=2*BField;
lambda=J/2/Gamma;

k=1;
dq=0.00001;
q=0:dq:pi;

wq=sqrt(1+2*lambda*cos(q)+lambda^2);

delta=log(cosh(0.5/k/T*Gamma*wq));
F=-k*T*(log(2)+1/pi*sum(delta)*dq);


