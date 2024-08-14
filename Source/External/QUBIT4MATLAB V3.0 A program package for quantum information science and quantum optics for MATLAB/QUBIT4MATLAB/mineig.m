% mineig   Minimum eigenvalue of a matrix 
%    mineig(M) gives back min(real(eig(M))).
%    Note the function real() in the expression.
%    This takes care of the small imaginary parts
%    appearing in calculations with MATLAB, which could
%    disturb the routine looking for the minimum.

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

function m=mineig(M);

m=min(real(eig(M)));

