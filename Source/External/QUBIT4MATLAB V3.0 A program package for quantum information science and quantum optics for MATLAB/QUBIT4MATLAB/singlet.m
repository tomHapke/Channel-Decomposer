%singlet   Defines a singlet state.
%   singlet(n) gives the state vector for an n-qubit singlet state.
%   (This is a state with zero total angular momentum.)
%   If argument n is omitted than the default is taken to be
%   the value of global variable N as default.
%   The function is implemented only for n=2 and n=4.

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


function s=singlet(varargin)
if isempty(varargin),
    global N;
else
    if length(varargin)~=1,
        error('Wrong number of input arguments.')
    end %if
    N=varargin{1};
end %if

if N==2,
   s=[0 1 -1 0].'/sqrt(2);
elseif N==4,
   s=zeros(16,1);
   s(3+1)=1;
   s(12+1)=1;
   s(6+1)=-0.5;
   s(9+1)=-0.5;
   s(5+1)=-0.5;
   s(10+1)=-0.5;
   s=s/sqrt(s'*s);
else
    error('singlet is implemented only for N=2 and N=4.')
end %if
