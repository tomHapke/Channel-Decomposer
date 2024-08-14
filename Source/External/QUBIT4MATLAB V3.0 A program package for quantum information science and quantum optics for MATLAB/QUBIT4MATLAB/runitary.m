% runitary   Random unitary
%    runitary(n,d) creates an n qudit random unitary where d is the 
%    dimension of the qudits. If d is omitted then it is taken to be 2.
%    If argument n is omitted than the default is taken to be
%    the value of global variable N. The random unitaries are 
%    equally distributed over U(d) according to the Haar measure.


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

function U=runitary(varargin);

if isempty(varargin)
    global N;
    d=2;
elseif length(varargin)==1
    N=varargin{1};
    d=2;
elseif length(varargin)==2
    N=varargin{1};
    d=varargin{2};
else
    error('Wrong number of input arguments.')
end %if

U=zeros(d^N,d^N);
% Create a random d^Nxd^N unitary
% from d^N orthogonal vectors
for k=1:d^N
    vv=randn(d^N,1)+i*randn(d^N,1); 
    for m=1:k-1
        vv=vv-U(:,m)*(U(:,m)'*vv);
    end %for
    U(:,k)=vv/sqrt(vv'*vv);
end %for 