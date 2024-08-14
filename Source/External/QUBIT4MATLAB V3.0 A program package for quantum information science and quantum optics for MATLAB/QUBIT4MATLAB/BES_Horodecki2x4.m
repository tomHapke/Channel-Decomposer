% BES_Horodecki2x4   Horodecki's 2x4 bound entangled state
%    BES_Horodecki2x4(b) gives Horodecki's two-qudit 
%    bound entangled state with the parameter b between 0 and 1.
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

function rho=BES_Horodecki2x4(b)

rho=diag([b b b b b b b b]);
rho(5,5)=(1+b)/2;
rho(8,8)=(1+b)/2;
rho(5,8)=sqrt(1-b*b)/2;
rho(8,5)=sqrt(1-b*b)/2;
rho(6,1)=b;
rho(7,2)=b;
rho(8,3)=b;
rho(1,6)=b;
rho(2,7)=b;
rho(3,8)=b;
rho=rho/(7*b+1);



