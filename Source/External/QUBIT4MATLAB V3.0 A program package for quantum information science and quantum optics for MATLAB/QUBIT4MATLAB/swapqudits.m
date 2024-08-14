% swapqudits    Swap two qudits of a qudit register
%   swapqudits(rho,k,l) swaps qudits k and l of the quantum state
%   rho. A state vector can also be given instead of
%   the density matrix rho. If the system is not a qubit
%   register, but a register of higher dimensional qudits
%   then we can use the form swapqudits(rho,k,l,d)
%   where d gives the dimension. If the density matrix given is sparse, 
%   then swapqudits will also produce a sparse matrix.

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

function mm=swapqudits(m,k,l,varargin)

if isempty(varargin)
    d=2;
elseif length(varargin)==1
    d=varargin{1};
else
    error('Wrong number of input arguments.');
end %if

N=floor(log2(max(size(m)))/log2(d)+0.5);
pattern=N:-1:1;
pattern(N-k+1)=l;
pattern(N-l+1)=k;
mm=reorder(m,pattern,d);


