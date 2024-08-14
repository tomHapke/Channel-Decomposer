% nm   Normalization
%    nm(v) converts vector v into a column vector and
%    normalizes it. If v is not a vector, then
%    it normalizes it as a density matrix setting
%    the trace to 1.

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

function w=nm(v)
   [y,x]=size(v);
   if y==1,
     w=v.';
     w=w/sqrt(w'*w);    
   elseif x==1,
     w=v;
     w=w/sqrt(w'*w);
   else
     w=v/trace(v);
   end %if
