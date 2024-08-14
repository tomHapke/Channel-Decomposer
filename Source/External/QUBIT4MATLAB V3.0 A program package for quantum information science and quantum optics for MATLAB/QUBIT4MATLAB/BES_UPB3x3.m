% BES_UPB3x3   3x3 bound entangled state constructed with UPBs
%    BES_UPB3x3 gives a two-qutrit bound entangled state with 
%    constructed with unextendible product bases.
%    See quant-ph/99080703v3.

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

function rho=BES_UPB3x3

f0=ket(kron([1  0  0],[1 -1  0]));
f1=ket(kron([1 -1  0],[0  0  1]));
f2=ket(kron([0  0  1],[0  1 -1]));
f3=ket(kron([0  1 -1],[1  0  0]));
f4=ket(kron([1  1  1],[1  1  1]));

rho=nm(qeye(2,3)-ketbra(f0)-ketbra(f1)-ketbra(f2)-ketbra(f3)-ketbra(f4));



