%  splattice  Lattice Hamiltonian for a 2D spin model with nn interaction with aperiodic 
%             boundary condition; sparse version.
%   splattice(op1,op2,Nx,Ny) gives the lattice Hamiltonian as a sparse matrix for 
%   a 2D spin for Nx*Ny qubits. op1 and op2 define the nearest-neighbor interaction. 
%   For the Hamiltonian aperiodic boundary condition is used.

% Copyright (C) 2006  Geza Toth    E.mail: toth@alumni.nd.edu
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

function Hzz=splattice(op1,op2,Nx,Ny)
 
N=Nx*Ny;
Hzz=sparse(2^N,2^N);

for iy=0:Ny-1
    for ix=1:Nx-1
       index=ix+Nx*iy;
       Hzz=Hzz+spinteract(op1,op2,index,index+1,N);
       disp(['x  ' num2str(index) ',' num2str(index+1)])
    end %for
    %%% Periodic BC
    %%if Nx>2,
    %%   Hzz=Hzz+spinteract(op2,op1,Nx*iy+1,Nx*iy+Nx,N);
    %%   disp(['px ' num2str(Nx*iy+Nx) ',' num2str(Nx*iy+1) ])
    %%end %if    
end %for
for ix=1:Nx
    for iy=0:Ny-2
       index=ix+Nx*iy;
       Hzz=Hzz+spinteract(op1,op2,index,index+Nx,N);
       disp(['y  ' num2str(index) ',' num2str(index+Nx)])
    end %for
    %%% Periodic BC
    %%if Ny>2,
    %%   Hzz=Hzz+spinteract(op2,op1,ix,ix+(Ny-1)*Nx,N); 
    %%   disp(['py ' num2str(ix+(Ny-1)*Nx) ',' num2str(ix)])
    %%end %if
end %for



