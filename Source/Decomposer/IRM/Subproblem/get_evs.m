function V = get_evs(J,a,b)

[U,D] = eig(J);

[~,i] =sort(diag(D,0),'descend');

V = U(:,i(a:b));

end