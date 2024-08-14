% shiftquditsright    Shift the qudits to the right
%   shiftquditsright(rho,n) shift the qubits of the state rho
%   by n qubits to the right. If n is not given, then it is
%   taken to be one. A state vector can also be given instead of
%   the density matrix rho. If the system is not a qubit
%   register, but a register of higher dimensional qudits
%   then we can use the form shiftquditsright(rho,n,d)
%   where d gives the dimension.

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

function mm=shiftquditsright(m,varargin)

if isempty(varargin)
    n=1;
    d=2;
elseif length(varargin)==1
    n=varargin{1};
    d=2;
elseif length(varargin)==2
    n=varargin{1};
    d=varargin{2};
else
    error('Wrong number of input arguments.');
end %if

n=-n;

N=log2(max(size(m)))/log2(d);
if 0>n,
   mm=reorder(m,[(N+n-1):-1:(-n),N:-1:N+n],d);
elseif n>0,
   mm=reorder(m,[N-n:-1:1 N:-1:N-n+1],d);
end %if


