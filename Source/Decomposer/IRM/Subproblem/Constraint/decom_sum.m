function Diff=decom_sum(J,C)

global d2g

Diff = -J;

for i = 1:d2g
    Diff = Diff + 1/d2g*C{i};
end
