% ccnr   Computable cross norm - realignment criterion
%    ccnr(rho) gives the trace norm of the realigned rho.
%    If it is larger than 1 then the system is entangled.
%    rho must be bipartite, with two parties of equal dimensions.

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

function c=ccnr(rho)

rho=ketbra2(rho);
[sy,sx]=size(rho);
c=trnorm(realign(rho));



