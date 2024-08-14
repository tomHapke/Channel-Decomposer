% overlapb   Maximal overlap with biseparable states
%            for a multi-qubit state. Use: overlapb(state)
%            where state is a state vector. The routine is
%            not based on numerical search thus gives
%            always a good result.

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

function maxoverlap=overlapb(state)

% Maximal overlap = the square of the maximum
% of the Schmidt coefficients corresponding to
% all bipartitioning

N=log2(length(state));

% Loop for all bipartitionings
maxoverlap=0;
for n=1:2^N-2
    list=[];
    b=dec2bin(n+2^N);
    for m=N:-1:1
       if b(m+1)=='1',
           list=[list,m];
       end %if
    end %for 
    if length(list)<=floor(N/2+0.51),
       maxoverlap=max(maxoverlap,max(eig(remove(ketbra(state),list))));
   end %if
end %for