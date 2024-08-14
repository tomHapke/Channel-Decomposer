% ketbra2   Creating a density matrix from an unnormalized state vector.
%    Creates a density matrix from a state vector. If it was
%    already a density matrix then it just normalizes it.

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

function k=ketbra2(f);
[sy,sx]=size(f);
if sx==1,
   k=f*f';
elseif sy==1,
   k=f'*f;
else
   k=f;
end %if
if trace(k)~=0,
   k=k/trace(k);
end %if
