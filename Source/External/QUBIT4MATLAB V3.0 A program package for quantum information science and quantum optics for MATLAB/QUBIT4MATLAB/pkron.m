% pkron   Repeats kron several times. That is, pkron(m,4)=mkron(m,m,m,m).


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

function m=pkron(matrix,no_of_repeatations)
   if no_of_repeatations==0,
      [sy,sx]=size(matrix);
      m=eye(sy,sx);
   else
      m=matrix;
      for n=2:no_of_repeatations
         m=kron(m,matrix);
      end %for
   end %if
