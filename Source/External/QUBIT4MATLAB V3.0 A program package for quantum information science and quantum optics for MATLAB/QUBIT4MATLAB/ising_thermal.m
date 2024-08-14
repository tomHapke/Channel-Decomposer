% ising_thermal - Internal energy of the Ising model in thermal equilibrium
%   ising_thermal(B,T) gives the internal energy 
%   per qubit of the Ising spin chain in a transverse field in the
%   thermodynamic limit, if the temperature is T, the  
%   field strength is B and the coefficient 
%   of the nearest neighbor coupling is 1.
%   ising_thermal(B,T,N) does the same for N qubits.

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

function E0=ising_thermal(BField,T,varargin)

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

   % Using Pfeuty, Ann. Phys. 57, 79-90 (1970)
   J=4;
   Gamma=2*BField;
   lambda=J/2/Gamma;

   k=1;
   N=1000;
   m=-N/2:1:N/2-1;
   q=2*pi*m/N;
   dq=1;

   wq=sqrt(1+2*lambda*cos(q)+lambda^2);

   % Normalization
   E0=sum(Gamma.*wq.*1./(exp(Gamma.*wq./k./T)+1))/N+ising_ground(BField);

else

   % Numerics for finite N
   x=[0 1;1 0];
   y=[0 -i;i 0]; 
   z=[1 0; 0 -1];
   e=[1 0; 0 1];

   % Using routines from the library to make the Ising Hamiltonian
   H=-nnchainp(x,x,N)-BField*nnchainp(z,e,N);
   rho=expm(-H/T);
   rho=rho/trace(rho);
   E0=trace(H*rho)/N;

end %if