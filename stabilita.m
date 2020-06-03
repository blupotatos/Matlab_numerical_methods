% MOSTRA L'INSTABILITA DEL METODO 
% DI ELIMINAZIONE  DI GAUSS SENZA PIVOTING
n = 3
xvera = ones(n,1);
epsilon = 10^(-15);
A = [1 1 -3; 2 2-epsilon 4; 1 9 4];
b = A* xvera;
disp('Usando la fattorizzazione LU calcolata senza pivoting')
[L,U] = lugauss(A);
disp('A - LU')
A - L*U
y = L\b;
x = U\y
err_rel = norm(x-xvera)/norm(xvera)
res_rel = norm(b-A*x)/norm(b)