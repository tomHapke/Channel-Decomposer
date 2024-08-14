% rvec   Random state vector for a given number of qudits.
%   rvec(n,d) gives an n-qudit random state vector,
%   the dimension of the qudit is given in d.
%   The distribution of a state vector obtained this way
%   is uniform over the sphere of unit vectors. If d is 
%   not given then it is assumed to be 2 (qubits).
%   If n is not given then it is taken to be equal to the
%   global variable N.

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

function s=rvec(varargin)

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

% Generate a random unit vector with complex elements.
% Before normalization, elements of the vector 
% have a normal distribution.
s=randn(d^N,1)+i*randn(d^N,1);
s=s/sqrt(s'*s);