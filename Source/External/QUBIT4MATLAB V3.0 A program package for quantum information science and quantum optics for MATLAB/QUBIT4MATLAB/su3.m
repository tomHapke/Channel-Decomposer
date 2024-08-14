% su3   Generators of SU(3)
%   Generators of SU(3) in m1,m2,...,m8.
%   (Gell-Mann matrices.)
%   Normalization: Tr(m_k*m_l)=2*delta_{kl}.
%   Defines also ee as the 3x3 identity matrix.

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

m1=[0 1 0;...
    1 0 0;...
    0 0 0];

m2=[0 -i 0;...
    i 0 0;...
    0 0 0];

m3=[1  0 0;...
    0 -1 0;...
    0 0 0];

m4=[0 0 1;...
    0 0 0;...
    1 0 0];

m5=[0 0 -i;...
    0 0 0;...
    i 0 0];

m6=[0 0 0;...
    0 0 1;...
    0 1 0];

m7=[0 0 0;...
    0 0 -i;...
    0 i 0];

m8=[1 0 0;...
    0 1 0;...
    0 0 -2]/sqrt(3);
