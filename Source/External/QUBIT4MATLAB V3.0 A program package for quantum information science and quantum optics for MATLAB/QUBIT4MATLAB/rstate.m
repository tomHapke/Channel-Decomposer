%rcstate    Defines a ring cluster state.
%   rstate(n) gives the state vector for an n-qubit ring cluster state.
%   If argument n is omitted than the default is taken to be
%   the value of global variable N.

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

function c=rstate(varargin)
if isempty(varargin),
    global N;
else
    if length(varargin)~=1,
        error('Wrong number of input arguments.')
    end %if
    N=varargin{1};
end %if

x=[0 1;1 0];
z=[1 0;0 -1];
y=i*x*z;

W=0;
for n=1:N-2;
  zxz=kron(kron(z,x),z);
  W=W-kron(kron(eye(2^(n-1)),zxz),eye(2^(N-n-2)));
end %for
W=W-kron(kron(kron(x,z),eye(2^(N-3))),z);
W=W-kron(z,kron(eye(2^(N-3)),kron(z,x)));
[v,d]=eig(W);
[junk,index]=min(diag(d));
c=v(:,index(1));
c=c/sqrt(c'*c);

