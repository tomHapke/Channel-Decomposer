% MATLAB routines for quantum mechanics.
% 
% General
%  contents             - List of commands
%  ver                  - Version
%  example1             - Example with two-state systems
%  example2             - Example with multi-qubit states
%  example3             - Example about operators in spin chains
%
% Bras and kets
%  ket                  - Creating a normalized column vector (Dirac's ket)
%  bra                  - Creating a normalized row vector    (Dirac's bra)
%  ketbra               - Creating a projector from a vector
%  ketbra2              - Creating a projector from the argument 
%                         if the argument is a vector.
%  braket               - Dirac's braket
%  ex                   - Expectation value
%  va                   - Variance
%  nm                   - Normalization
%
%
% Reordering a qudit register
%  mkron                - Kronecker product with several arguments
%  pkron                - Multiplying a matrix with istself given times
%                         using the Kornecker product
%  remove               - Reduced density matrix in a qudit register
%  keep                 - Reduced density matrix in a qudit register
%  reorder              - Reorder a register of qudits
%  reordermat           - The operator corresponding to reordering
%                         a register of qudits
%  reordervec           - Transformation vector for reordering 
%                         a register of qudits
%  shiftquditsleft      - Shift qudits to the left
%  shiftquditsright     - Shift qudits to the right
%  swapqudits           - Swap two qudits of a quantum state
%
%
% Interesting quantum states, quantum gates and operators
%  ghzstate             - Greenberger-Horne-Zeilinger state
%  cstate               - Cluster state
%  rstate               - Ring cluster state
%  gstate               - Graph state
%  gstate_stabilizer    - Stabilizer of a graph state
%  wstate               - W state
%  dstate               - Symmetric Dicke state
%  singlet              - Singlet state
%  mestate              - Maximally entangled state
%  mmstate              - Density matrix for the maximally mixed state
%  smolinstate          - Smolin's four-qubit bound entangled state
%  BES_Horodecki3x3     - Horodecki's 3x3 bound entangled state
%  BES_Horodecki2x4     - Horodecki's 2x4 bound entangled state
%  BES_UPB3x3           - 3x3 UPB bound entangled state
%  U_CNOT               - 4x4 unitary matrix of a CNOT gate
%  U_H                  - 2x2 unitary matrix for the Hadamard gate
%  paulixyz             - Define Pauli matrices x,y,z and e=eye(2)
%  su3                  - Define the SU(3) generators m1,...,m8 and ee=eye(3)
%  su3_alternative      - Define alternative SU(3) generators
%
%  
% Formatted input/output
%  printv               - Print state vector in product basis
%  decompose            - Display pauli decomposition of a matrix
%  paulistr             - Convert symbolic string to operator 
%
%
% Two-qudit interactions and spin chains
%  quditop              - Operator acting on a qudit of a qudit register
%  twoquditop           - Operator acting on two qudits of a qudit register
%  coll                 - Define a collective multi-qudit operator
%  interact             - Two-qudit interaction acting on given qudits
%  nnchain              - Spin chain Hamiltonian
%  nnchainp             - Spin chain Hamiltonian with a periodic boundary
%                         condition
%  ising                - Ising spin chain Hamiltonian
%  isingp               - Ising spin chain Hamiltonian with a periodic 
%                         boundary condition
%  ising_ground         - Ground state energy of Ising model
%  ising_free           - Free energy in thermal state
%  ising_thermal        - Internal energy in thermal state
%  ising_classical_ground - Ground state energy for the classical Ising model
%  heisenberg           - Heisenberg spin chain Hamiltonian
%  heisenbergp          - Heisenberg spin chain Hamiltonian with a periodic 
%                         boundary condition
%  xy_classical_ground  - Ground state energy for the classical xy model
%  orthogobs            - Orthogonal observables for a qudit
%
%
% Entanglement
%  pt                   - Partial transpose for a qudit register
%  negativity           - Compute the negativity of the density
%                         matrix
%  concurrence          - Concurrence for a two-qubit matrix
%  realign              - Realignment of a density matrix
%  ccnr                 - Computable Cross Norm - Realignment criterion
%  mrealign             - Realignment for multiqudit systems
%  optspinsq            - Optimal spin squeezing inequalities
%  schmidt              - Schmidt coefficients for a pure state
%  maxsep               - Maximum of an operator for separable states
%  maxsymsep            - The same as maxsep but for
%                         permutationally invariant sep. states
%  maxbisep             - Maximum of an operator for biseparable states
%  maxb                 - Like maxbisep, but for all bipartitons
%  overlapb             - Maximum overlap of a pure state with bisep. states
%
%
% Random vectors, matrices and operations
%  rvec                - Random state vector for a given number of
%                        qudits
%  rproduct            - Random product state vector for a given
%                        number of qudits
%  rdmat               - Random density matrix for a qudit register
%  runitary            - Random unitary for a qudit register
%  twirl               - Twirling
%  twirl2              - How close is a state to Werner states
%
%
% Miscellenous simple commands
%  proj_sym             - Projector to the symmetric subspace
%  proj_asym            - Projector to the antisymmetric subspace
%  maxeig               - Maximum eigenvalue of a matrix    
%  mineig               - Minimum eigenvalue of a matrix 
%  trace2               - Trace-square of a matrix
%  trnorm               - Trace-norm
%  comm                 - Commutator
%  grstate              - Normalized ground state of a Hamiltonian
%  thstate              - Thermal ground state
%  addnoise             - Add white noise to a quantum state
%  binom                - Binomial
%  qvec                 - Empty statevector for given number of qudits
%  qsize                - Size of state vector or density matrix in qudits
%  qeye                 - Identity matrix for given number of qudits
%
%
% Commands with sparse matrices
%  spreordermat         - Sparse version of reordermat
%  spcoll               - Sparse version of coll
%  spinteract           - Sparse version of interact
%  spnnchain            - Sparse version of nnchain
%  spnnchainp           - Sparse version of nnchainp
%  spising              - Sparse version of ising
%  spisingp             - Sparse version of isningp
%  spquditop            - Sparse version of quditop
%  sptwoquditop         - Sparse version of twoquditop
%  splatticep           - Two-dimensional lattice Hamiltonian, periodic BC, sparse
%  splattice            - Two-dimensional lattice Hamiltonian, aperiodic BC, sparse
%  spising2Dp           - Two-dimensional Ising Hamiltonian, periodic BC, sparse
%

% Copyright (C) 2005-2007  Geza Toth    E.mail: toth@alumni.nd.edu
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


