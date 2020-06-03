n = 3;
xvera = ones(n,1);
epsilon = 10^(-15);
A = [1 1 -3; 2 2-epsilon 4; 1 9 4];
b = A* xvera;
disp('Usando la fattorizzazione LU calcolata senza pivoting')
[L,U] = lugauss(A);
disp('A - LU')  %mi da zero!!! verifica correttezza fattorizzazione
A - L*U
y = L\b;
x = U\y
err_rel = norm(x-xvera)/norm(xvera)
res_rel = norm(b-A*x)/norm(b)


disp('Usando pivoting parziale per righe')
[L,U,P] = lu(A);
disp('PA - LU')
P*A - L*U
y = L\P*b;
xpiv = U\y
err_rel_con_piv = norm(xpiv-xvera)/norm(xvera)
res_rel_con_piv = norm(b-A*xpiv)/norm(b)