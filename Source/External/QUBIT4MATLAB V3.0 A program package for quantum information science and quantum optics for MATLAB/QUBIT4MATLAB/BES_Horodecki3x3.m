% BES_Horodecki3x3   Horodecki's 3x3 bound entangled state
%    BES_Horodecki3x3(a) gives Horodecki's two-qutrit 
%    bound entangled state with the parameter a between 0 and 1.
%    See quant-ph/9801069v1.

% Copyright (C) 2007  Geza Toth    E.mail: toth@alumni.nd.edu
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

function rho=BES_Horodecki3x3(a)

rho=diag([a a a a a a a a a]);
rho(7,7)=(1+a)/2;
rho(9,9)=(1+a)/2;
rho(9,7)=sqrt(1-a*a)/2;
rho(7,9)=sqrt(1-a*a)/2;
rho(5,1)=a;
rho(9,1)=a;
rho(5,9)=a;
rho(1,5)=a;
rho(1,9)=a;
rho(9,5)=a;
rho=rho/(8*a+1);



