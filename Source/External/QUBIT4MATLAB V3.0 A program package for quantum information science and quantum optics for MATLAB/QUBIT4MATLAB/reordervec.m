% reordervec  Transformation vector for reordering the qudits according to
%             the given pattern.
%    reordervec(pattern,d) gives a transformation vector for
%    putting the qudits in the order given in pattern.
%    The ith element of the vector tells us where to move
%    the ith element of a state vector during the reordering.
%    d is the dimension of the qudit. If it is omitted then
%    the default value is 2 (qubits).
%    pattern=[N N-1 N-2 ... 1] does not change the ordering.
%    The numbering of qudits can be indicated by the expression
%    mkron(b4,b3,b2,b1).

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

function vec=reordermat(pattern,varargin)

if isempty(varargin),
    % qubits
    base=2;
else
    if length(varargin)~=1,
        error('Wrong number of input arguments.');
    end %if
    base=varargin{1};
end %if

% Pattern: numbers from 1 to N.
% No order changes: pattern = 8 7 6 5 4 3 2 1 

% If it is a row vector, transform it into column vector
[y,x]=size(pattern);
if x>1,
   pattern=pattern.';
end %if

pattern=pattern-1;

N=length(pattern);
vec=zeros(base^N,1);
a=zeros(N,1);
n=1;
while 1
   vec(sum(base.^pattern.*a)+1)=n;
   k=N;
   a(k)=a(k)+1;
   while a(k)==base
       a(k)=0;
       k=k-1;
       if k==0,
           return
       end %if
       a(k)=a(k)+1;
   end %while
   n=n+1;
end %while