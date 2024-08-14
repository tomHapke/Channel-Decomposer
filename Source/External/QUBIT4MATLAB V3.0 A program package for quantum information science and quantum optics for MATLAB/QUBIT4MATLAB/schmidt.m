% schmidt   Schmidt coefficients of a pure state.
%   Used in the form schmidt(state,list) where state is
%   a state vector and list is a list of qubits in order to
%   define bi-partitioning. Qubit numbering is the same as 
%   in the case of the function remove.

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

function coeff=schmidt(state,list)
coeff=eig(remove(ketbra(state),list));
