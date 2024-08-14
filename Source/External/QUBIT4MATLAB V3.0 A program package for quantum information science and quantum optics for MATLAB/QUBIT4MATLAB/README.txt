QUBIT4MATLAB :

MATLAB PACKAGE FOR QUANTUM INFORMATION/
QUANTUM MECHANICS BY GEZA TOTH

This program package helps modeling spin chains,
qubit registers, etc. according to non-relativistic
quantum mechanics and some novel ideas from quantum
information theory.

In particular, it contains MATLAB routines for 
reordering qubits, for computing the reduced density 
matrix after removing some of the qubits, for partial 
transposition, etc. Most of the routines work also for 
qudits. It also has routines for handling GHZ states, 
cluster states, graph states, Dicke states, etc.

Usage: Create a directory with the name QUBIT4MATLAB.
Copy the routines into it. Then, using the "Set Path" 
menu item of the "File" menu, setup MATLAB such 
that it looks for commands in this directory.

For the list of functions please write

         help qubit4matlab

For examples please see

         example1
         example2
         example3

Guide book is available at  

            http://dx.doi.org/10.1016/j.cpc.2008.03.007
            (only with subscription to CPC)

            http://uk.arxiv.org/abs/0709.0948
         
            http://arxiv.org/abs/0709.0948

General public licence:

         gpl.txt

Please send bug reports to
 
         toth@alumni.nd.edu

with the subject

         qubit4matlab

----------------------------------------------

History of versions:

QM versions:

V1.0         12 Apr  2005

V1.1         14 June 2005

keep/remove: bug corrected
new functions for qudits
new functions for spin chains

Name changed to QUBIT4MATLAB:

QUBIT4MATLAB V1.0    1 Sept 2005
nm:          bug corrected

QUBIT4MATLAB V1.1   23 Sept 2005
example1/2/3 added
addnoise:    added
negativity:  added
ising_free:  small bug corrected

QUBIT4MATLAB V1.2   26 Jan 2006
mineig:      added
maxeig:      added
spmqubitop:  name changed to mqubitopsp
printv:      bug corrected (did not work correctly for complex
             coefficients.)
qrvec:       added
qrproduct    added
interact     added
interactsp   added
twirl,twirl2 small bug corrected (the description did not fit
             what the routine was doing)
concurrence  added
realign      added

QUBIT4MATLAB V2.0   02 Oct 2006
qrvec             name changed to rvec
qrproduct         name changed to rproduct
runitary          added
rdmat             added

grstate           added
thstate           added

ising             added
isingp            added
spising           added
spisingp          added
heisenberg        added
heisenbergp       added
spnnchain         added
spnnchainp        added
coll              added
spcoll            added
spnnchain         added
spnnchainp        added
splattice         added
splatticep        added
spsising2Dp       added
spinteract        added
ising_classical_ground  added
xy_classical_ground     added

bra               added
braket            added
ex                added

swapquidts        added
shiftquditsleft   added
shiftquditsright  added
reordervec        added
reorder           more efficient with large state vectors 
                  (>10 qubits); can use sparse matrices;
                  does not use dec2base for counting but
                  uses a faster method.
spreordermat      added
keep              Before keep(rho,[1 2]) and keep(rho,[2 1]) 
                  gave the same result. Now they give results
                  which are permutations of each other.
                  (qubit 1 and qubit 2 are exchanged)

decompose         faster since does not use dec2base for counting

twirl             works for qudits
twirl2            works for qudits

quditop           added
spquditop         added
twoquditop        added
sptwoquditop      added

printv            treshold can be given as a second parameter
mestate           added
mmstate           added
mqubitop          removed: obsolete; use quditop and twoquditop

U_CNOT            added
U_H               added    
concurrence       added


QUBIT4MATLAB V3.0  06 October 2007
maxsymsep         bug in second part of search repaired 
                  (it did not reach the maximum, just a value close to it)
va                added
contents          typos corrected
smolinstate       added
swapqudits        bug corrected; did not work correctly for qudits, 
                  only for qubits
addnoise          works also for qdits for d>2
trnorm            added
maxsep            works now also for quidts with dimension larger than 2
maxsymsep         works now also for quidts with dimension larger than 2
mrealign          added
ccnr              added
proj_asym         added
proj_sym          added
BES_Horodecki3x3  added
BES_Horodecki2x4  added
BES_UPB3x3        added
orthogobs         added
keep              works for qudits
maxsep            parameters of the numerical search can be set
                  by an extra argument
maxsymsep         parameters of the numerical search can be set
                  by an extra argument
maxbisep          parameters of the numerical search can be set
                  by an extra argument
maxb              parameters of the numerical search can be set
                  by an extra argument
optspinsq         added

QUBIT4MATLAB V3.01  10 September 2007
Some typos in help text are corrected.

QUBIT4MATLAB V3.02  12 October 2007
maxsymsep         bug concerning parameter setting corrected
                  (default parameter set was not possible to overwrite)
maxsymsep         Gives also back the state giving the maximum.
example3          improved

QUBIT4MATLAV v3.03 25 April 2008
decompose         help text corrected
keep_nonorm       added