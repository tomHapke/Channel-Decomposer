%coll  Defines a collective operator which is the sum of single-qudit operators.
%   coll (op,n) defines an operator of the type sum_k op(k) where
%   op(k) denotes the operator op acting on qubit k.
%   If argument n is omitted than the default is taking to be
%   the value of global variable N. The size of op determines
%   whether we talk about qubits, qudits, etc.

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

function c=coll(op,varargin)
if isempty(varargin),
    global N;
else
    if length(varargin)~=1,
        error('Wrong number of input arguments.')
    end %if
    N=varargin{1};
end %if

% Dimension (d=2 for qubits, d=3 for qutrits, etc.)
d=max(size(op));

c=zeros(d^N);
for n=1:N
    c=c+kron(kron(eye(d^(n-1)),op),eye(d^(N-n)));
end %for
