%risolvere sistema lineare Ax=b con epsilon=1e-14 con b in modo che 
% x=[1 1 1]T  poi trovata la soluzione approssimata x calcolare residuo ed
% errore relativo. Ripetere ma sta volta usando il pivoting [L,U,P]=lu(A)

epsi=1e-15;
A=[1 1 -3; 2 2-epsi 4; 1 9 4];
xvera=[1; 1; 1];

b=A*xvera;

[L, U]=lugauss(A);
y=L\b;
x=U\y;
err_rel = norm(x-xvera)/norm(xvera);
res_rel = norm(b-A*x)/norm(b);
fprintf('NO PIVOTING \n residuo relativo %f \n errore relativo %f \n', res_rel, err_rel);

%ora con fattorizzazione con pivoting
[L, U, P]= lu(A);
y = L\P*b;
xpiv = U\y
err_rel = norm(xpiv-xvera)/norm(xvera);
res_rel = norm(b-A*xpiv)/norm(b);
fprintf('\n PIVOTING \n residuo relativo %f \n errore relativo %f \n', res_rel, err_rel);
