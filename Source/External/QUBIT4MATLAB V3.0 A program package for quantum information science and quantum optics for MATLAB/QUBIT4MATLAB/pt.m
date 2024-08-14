% pt    partial transposition of a density matrix
%       for a qudit register.
%    pt(M,list,d) computes the matrix obtained from M
%    by partially transposing the qudits given in the list.
%    The numbering of the qudits starts with 1.
%    Here d is the dimension of the qudits.
%    If d is not provided then d is taken to be 2 (qubits).
%    M is normalized making the trace 1 before any further
%    computation. If instead of a density matrix, a state vector
%    is provided for M, then this vector is transformed to 
%    a density matrix before computing the partial transpose.

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

function rhoT=pt(rho,list,varargin)

rho=ketbra2(rho);

if nargin==2,
   d=2;
elseif nargin==3,
   d=varargin{1};
else    
   error('Wrong number of input arguments.');
end %if
 
   for n=1:length(list)
      nn=list(n);
      nmax=d^(nn-1);
      nmax2=d^nn;
      [y,x]=size(rho);
      rhoT=zeros(y,x);

      % Partial transpostion #1
      for k=1:nmax
      for l=1:nmax
          rhoT(k:nmax:end,l:nmax:end)=rho(k:nmax:end,l:nmax:end).';
      end %for
      end %for

      rho=rhoT;

      % Partial transpostion #2
      for k=1:nmax2
      for l=1:nmax2
          rhoT(k:nmax2:end,l:nmax2:end)=rho(k:nmax2:end,l:nmax2:end).';
      end %for
      end %for 
      
      rho=rhoT;
   end %for
   

