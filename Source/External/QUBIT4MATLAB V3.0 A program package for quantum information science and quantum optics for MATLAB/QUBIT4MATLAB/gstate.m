%gstate    Defines a graph state.
%   gstate(Gamma) gives the state vector for a graph state
%   corresponding to a connectivity matrix Gamma.
%   The form [g,stab]=gstate(Gamma) gives the state
%   vector for the graph state in vector g and the 
%   generator of the stabilizer in the cell array stab.

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

function [g,stab]=gstate(Gamma)

x=[0 1;1 0];
z=[1 0;0 -1];
y=i*x*z;

% Get the generators of the stabilizer
stab=gstate_stabilizer(Gamma);

W=0;
for n=1:length(stab)
   W=W-stab{n};
end %for n

[v,d]=eig(W);
[junk,index]=min(diag(d));
g=v(:,index(1));
g=g/sqrt(g'*g);

