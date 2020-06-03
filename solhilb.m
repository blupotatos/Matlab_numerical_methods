%genera matrice di hilbert H di ordine 12 e risolve sitema Hx=b con b 
%t.c. soluzione x=[1....1]T e calcola numero condizionemento di H e
%err. e il residuo RELATIVI

n=12;
H=hilb(n);
xvera=ones(n,1);
kappa=cond(H);
fprintf('\n\t [cond K_2(H)]     %3.3e', kappa);
b=H*xvera;
x=H\b;
err_rel=norm(x-xvera)/norm(xvera);
fprintf('\n\t [ERRORE RELATIVO]     %3.3e', err_rel); %t sta per tab
res_rel=norm(b-H*x)/norm(b);
fprintf('\n\t [RESIDUO RELATIVO)]     %3.3e', res_rel);
fprintf('\n');
