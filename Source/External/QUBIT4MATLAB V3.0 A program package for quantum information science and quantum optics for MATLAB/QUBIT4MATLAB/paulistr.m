% paulistr   Converts a Pauli string into an operator.
%   Form of use: paulistr(string). E.g., paulistr('5*xye+xyz') results
%   in 5*mkron(x,y,e)+mkron(x,y,z). Here x,y,z and e are defined by
%   the command paulixyz. The letter 'e' represents
%   the 2x2 identity matrix.

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


function op=paulistr(pstring)

x=[0 1;1 0];
z=[1 0;0 -1];
y=i*x*z;
e=eye(2);

index=1;

pstring2='';
while index<=length(pstring),
    s=pstring(index);
    if s=='e' || s=='x' || s=='y' || s=='z',
        pstring2=[pstring2,'mkron(' s];
        index=index+1;
        if index>length(pstring),
            pstring2=[pstring2 ')'];
	    op=eval(pstring2);
            return;
        end %if
        s=pstring(index);
        while s=='e' || s=='x' || s=='y' || s=='z',
           pstring2=[pstring2 ',' s];
           index=index+1;
           if index>length(pstring),
              pstring2=[pstring2 ')'];
	      op=eval(pstring2);
              return;
           end %if
           s=pstring(index);         
        end %while
        pstring2=[pstring2 ')'];
    else
        pstring2=[pstring2,s];
        index=index+1;
    end %if
end %while


