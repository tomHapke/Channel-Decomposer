% orthogobs   Orthogonal observables for a qudit
%   orthogobs(d) gives the array of d^2 local orthogonal observables
%   for a d-state system. obs=orthogobs(d) gives back a d x d x d^2
%   dimensional matrix. The kth observable can be accessed as obs(:,:,k).
%   These observables fulfill trace(A_k*A_l)=0 for k>l and
%   trace(A^2)=1. For the definition of such observables
%   see http://www.arxiv.org/abs/quant-ph/0412220v2.

% Copyright (C) 2007  Geza Toth    E.mail: toth@alumni.nd.edu
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

function obs=orthogobs(d)

obs=zeros(d,d,d^2);
index=1;

for n=1:d    
    v=zeros(d,1);
    v(n)=1;
    obs(:,:,index)=v*v.';
    index=index+1;
end %for

for n=1:d
    for m=1:n-1
        v=zeros(d,1);
        v(n)=1;
        u=zeros(d,1);
        u(m)=1;
        obs(:,:,index)=(u*v.'+v*u.')/sqrt(2);
        index=index+1;
    end %for
end %for

for n=1:d
    for m=1:n-1
        v=zeros(d,1);
        v(n)=1;
        u=zeros(d,1);
        u(m)=1;
        obs(:,:,index)=(u*v.'-v*u.')/i/sqrt(2);
        index=index+1;
    end %for
end %for


