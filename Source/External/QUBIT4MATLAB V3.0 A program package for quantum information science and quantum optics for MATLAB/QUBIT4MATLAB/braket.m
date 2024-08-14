% braket  Dirac's bra-ket
%    braket(phi1,phi2) denotes the scalar product of phi1 and phi2.
%    braket(phi1,op,phi2) is the same as bra(phi1)*op*ket(phi2).

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

function b=braket(phi1,varargin)
   if length(varargin)==1,
       b=bra(phi1)*ket(varargin{1});
   else
       b=bra(phi1)*varargin{1}*ket(varargin{2});
   end %if