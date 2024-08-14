% negativity   Negativity for a qudit register.
%    negativity(M,list,d) computes the matrix obtained from M
%    by partially transposing the qudits given in the list,
%    and returns with the sum of the absolute value of the 
%    negative eigenvalues of this matrix. 
%    Note that M is normalized to be a density matrix,
%    before computing the eigenvalues.
%    That is, it computes the negativity
%    corresponding to a given partitioning.
%    The numbering of the qudits starts with 1.
%    Here d is the dimension of the qudits.
%    If d is not provided then it is taken to be 2 (qubits).

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


function neg=negativity(rho,list,varargin);

if isempty(varargin),
   d=2;
else
    if length(varargin)~=1,
        error('Wrong number of input arguments.');
    end %if
    d=varargin{1};
end %if

% Convert state vector to density matrix if necessary
rho=ketbra2(rho);

[v,d]=eig(pt(rho,list,d));

d=diag(d);

% real is needed because MATLAB tends to produce
% small imaginary parts in some computation
d=real(d);

neg=-sum(d.*(d<0));


