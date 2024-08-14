% reorder   Reorder a state vector or a density matrix according to
%           the given pattern.
%    reorder(v,pattern) transforms a state vector or a density matrix
%    putting the qubits in the order given in pattern.
%    pattern=[N N-1 N-2 ... 1] does not change the ordering.
%    The numbering of qubits can be indicated by the expression
%    mkron(b4,b3,b2,b1). The format reorder(v,pattern,d)
%    makes it possible to handle d-dimensional systems,
%    not only qubits. If the density matrix given is sparse, 
%    then reorder will also produce a sparse matrix.

% Copyright (C) 2005-2006  Geza Toth    E.mail: toth@alumni.nd.edu
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

function mm=reorder(m,pattern,varargin)
% Pattern: numbers from 1 to N.
% No order changes: patterns = 8 7 6 5 4 3 2 1

if isempty(varargin),
   d=2;
else
    if length(varargin)~=1,
        error('Wrong number of input arguments.');
    end %if
    d=varargin{1};
end %if

[y,x]=size(m);
if min(x,y)==1,
  if y==1, 
      m=m.'; 
  end %if
  % m is a state vector
  mm=zeros(y,x);
  mm(reordervec(pattern,d))=m;
elseif issparse(m)
  % m is a sparse density matrix
  r=spreordermat(pattern,d);
  mm=r*m*r.';
else
  % m is a density matrix
  r=reordermat(pattern,d);
  mm=r*m*r.';
end %if