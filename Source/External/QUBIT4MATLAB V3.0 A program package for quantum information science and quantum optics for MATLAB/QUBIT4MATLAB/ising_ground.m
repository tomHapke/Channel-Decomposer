% ising_ground   Ground state energy of the quantum Ising model 
%   ising_ground(B) gives the ground state energy of the
%   Ising model per qubit in transverse field in the
%   thermodynamic limit, if the 
%   field strength is B and the coefficient 
%   of the nearest neighbor coupling is 1.
%   ising_ground(B,N) does the same for N qubits.

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

function E0=ising_ground(BField,varargin)

if isempty(varargin),
    N=Inf;
else
    if length(varargin)~=1,
        error('Wrong number of input arguments.')
    end %if
    N=varargin{1};
end %if

% Thermodynamical limit
if N==Inf;

   k=1;          % Boltzmann constant

   % Using the paper
   % Pfeuty, Ann. Phys. 57, 79-90 (1970)
   % Eq. (3.2)
   J=4;
   Gamma=2*BField;
   lambda=J/2/Gamma;

   % Elliptic integral
   dphi=pi/1000000;
   phi=0:dphi:pi/2;
   theta=sqrt(4*lambda/(1+lambda)^2);
   Eint=sum(sqrt(1-theta^2*sin(phi).^2))*dphi;
   % Ground state energy/N
   E0=-Gamma*2/pi*(1+lambda)*Eint/2;

   % /2 is added compared to the paper ...

else
   % Numerical solution for N qubits

   x=[0 1;1 0];
   y=[0 -i;i 0]; 
   z=[1 0; 0 -1];
   e=[1 0; 0 1];

   % Using routines from the library to make the Ising Hamiltonian
   H=-nnchainp(x,x,N)-BField*nnchainp(z,e,N);
   E0=min(real(eig(H)))/N;

end %if

