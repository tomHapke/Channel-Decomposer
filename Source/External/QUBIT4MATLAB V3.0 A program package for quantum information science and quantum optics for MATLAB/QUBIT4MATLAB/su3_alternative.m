% su3_alternative   Alternative generators of SU(3)
%   Generators of SU(3) in m1,m2,...,m8.
%   Normalization: Tr(m_k*m_l)=2*delta_{kl}.
%   Defines also ee as the 3x3 identity matrix.
%   See for example J. Lawrence, quant-ph/0403095

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

ee=eye(3);

w=exp(i*2*pi/3);
Z=ketbra([1 0 0])+ketbra([0 1 0])*w+ketbra([0 0 1])*w^2;
X=ket([0 1 0])*ket([1 0 0]).'+ket([0 0 1])*ket([0 1 0]).'+...
  ket([1 0 0])*ket([0 0 1]).';
Y=X*Z;
V=X*Z*Z;

m1=(Z-Z')/i/sqrt(3);
m2=(X-X')/i/sqrt(3);
m3=(Y-Y')/i/sqrt(3);
m4=(V-V')/i/sqrt(3);
m5=(Z+Z')/sqrt(3);
m6=(X+X')/sqrt(3);
m7=(Y+Y')/sqrt(3);
m8=(V+V')/sqrt(3);
