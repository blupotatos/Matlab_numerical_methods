function [x,iter,vscarti]=jacobi(A,b,x0,itmax,tol)
% Metodo iterativo di JACOBI
%------------------------------------------------
% [x,iter,vscarti]=jacobi(A,b,x0,itmax,tol)
%------------------------------------------------
% Dati di OUTPUT: 
%------------------------------------------------
% x: vettore soluzione calcolato
% iter: numero di iterazioni effettuate
% vscarti: vettore contenente le norme degli scarti
%------------------------------------------------
% Dati di INPUT: 
%------------------------------------------------
% A,b: matrice del sistema e termine noto, rispettivamente
% x0: vettore soluzione iniziale
% tol: tolleranza per il test d'arresto sullo scarto
% itmax: numero massimo di iterazione permesse
%------------------------------------------------

[n,m] = size(A);
% vettore iniziale x_0 
xold = x0;
% partizionamento della matrice
D = diag(diag(A));
L = tril(A,-1);
U = triu(A,1);
M = D;
N = -(L +U);
% vettore contenente le norme degli scarti calcolati ad ogni iterazione
vscarti= [];
%la variabile scarto conterra' la NORMA del vettore x_k+1 - x_k 
scarto = 1; % all'inizio si inizializza ad un qualsiasi valore > di tol
iter = 0;
% ciclo iterativo M x_k+1 = N x_k + b; 
while scarto > tol && iter < itmax
    iter = iter + 1;
    tnoto = N*xold + b;
    x = M\tnoto;
    scarto = norm(x-xold);
    vscarti = [vscarti;scarto];
    xold = x;
end
