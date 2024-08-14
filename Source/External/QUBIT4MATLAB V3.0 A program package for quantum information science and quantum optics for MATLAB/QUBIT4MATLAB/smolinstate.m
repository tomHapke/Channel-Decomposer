% smolinstate   Gives the four-qubit bound entangled state 
%               defined by Smolin in 
%               http://www.arxiv.org/abs/quant-ph/0001001


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

function s=smolinstate

f1=kron([1 0 0 1],[1 0 0 1]);
f2=kron([1 0 0 -1],[1 0 0 -1]);
f3=kron([0 1 1 0],[0 1 1 0]);
f4=kron([0 1 -1 0],[0 1 -1 0]);

s=(f1'*f1+f2'*f2+f3'*f3+f4'*f4)/4;