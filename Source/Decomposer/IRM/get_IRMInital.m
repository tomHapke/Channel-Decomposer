function  [e0, C0, U0] = get_IRMInital(J)

global d1g d2g

d = d1g*d2g;
dm = d1g*(d2g-1);

U0 = zeros(d,dm,d2g);
C0 = zeros(d,d,d2g);

V = get_evs(J,d1g+1,d);

for i = 1 : d2g
    U0(:,:,i) = V;
    C0(:,:,i) = J;
end

d = eigs(J,d1g+1);

e0 = d(d1g+1);