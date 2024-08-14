% qsize   Size in qudits. Both qsize(v,d) and qsize(rho,d) can be used,
%         where d is the dimension of the qudit. If d is omitted, then
%         it is assumed to be 2.

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

function q=qsize(matrix,varargin)

if isempty(varargin)
    d=2;
elseif length(varargin)==1
    d=varargin{1};
else
    error('Wrong number of input arguments.')
end %if

[sy,sx]=size(matrix);
q=log2(max(sx,sy))/log2(d);
