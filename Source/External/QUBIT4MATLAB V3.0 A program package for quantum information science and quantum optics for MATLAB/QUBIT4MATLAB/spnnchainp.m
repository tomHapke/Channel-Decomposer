% spnnchainp   Defines a Hamiltonian with a(k)b(k+1) nearest-neighbor
%              and periodic boundary condition; sparse version.
%   spnnchainp (a,b,n) defines a a(k)b(k+1) type Hamiltonian
%   with a periodic boundary condition.
%   The Hamiltonian is given as a sparse matrix.
%   If argument n is omitted than the default is taking to be
%   the value of global variable N.

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

function h=spnnchainp(a,b,varargin)
if isempty(varargin),
    global N;
else
    if length(varargin)~=1,
        error('Wrong number of input arguments.')
    end %if
    N=varargin{1};
end %if
h=sparse(2^N,2^N);
op=kron(a,b);
for n=1:N-1
    h=h+kron(kron(speye(2^(n-1)),op),speye(2^(N-n-1)));
end %for
% Periodic boundary condition
if N>1,
   h=h+kron(kron(b,speye(2^(n-1))),kron(speye(2^(N-n-1)),a));
end %for
