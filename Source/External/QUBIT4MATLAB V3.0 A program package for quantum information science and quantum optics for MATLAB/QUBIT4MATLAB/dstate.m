%dstate   Defines a symmetric Dicke state.
%   dstate(e,n) gives the state vector for an n-qubit symmetric
%   Dicke state with e excitations. If argument n is omitted 
%   then the default is taken to be the value of global variable N.

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

function w=dstate(e,varargin)
if isempty(varargin),
    global N;
else
    if length(varargin)~=1,
        error('Wrong number of input arguments.')
    end %if
    N=varargin{1};
end %if
w=zeros(2^N,1);
for n=1:2^N
   % Conversion to binary 
   b=dec2bin(n-1+2^N);
   b=b(2:end);  
   a=[];
   for k=1:length(b)
      a=[a;str2num(b(k))];
   end %for
   if sum(a)==e,
      w(n)=1;
   end %if
end %for
w=w/sqrt(w'*w);
