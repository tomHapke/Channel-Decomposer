% realign   Realignment of the bipartite density matrix.
%    realign(M) realigns the matrix M (that can be a density matrix)
%    in a bipartite system where the two parties have equal dimensions.
%    If the trace norm of the realigned density matrix is larger than 1
%    then the state is entangled. For more details see 
%    O. Rudoplh, Phys. Rev. A 67, 032312 (2003).


% Copyright (C) 2006-2007  Geza Toth    E.mail: toth@alumni.nd.edu
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

function rhoR=realign(rho)

[sy,sx]=size(rho);
d=floor(sqrt(sy)+0.5);
rhoR=mrealign(rho,[4 2 3 1],d);