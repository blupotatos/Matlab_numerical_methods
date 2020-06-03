% Calcolo del raggio spettrale della matrice di iterazione 
% di un metodo iterativo classico

A = [4 -1 0 0 ; -1 4 -1 0 ; 0 -1 4 -1; 0 0 -1 4];
%ALTERNATIVAMENTE
%n=4; %dimensione della matrice A quadrata
%u=4*ones(n,1);
%t=-ones(n-1,1);
%A=diag(u)+diag(t,1)+diag(t,-1);


 A = [4 -1 0 0 ; -1 4 -1 0 ; 0 -1 4 -1; 0 0 -1 4];
%ALTERNATIVAMENTE
%n=4; %dimensione della matrice A quadrata
%u=4*ones(n,1);
%t=-ones(n-1,1);
%A=diag(u)+diag(t,1)+diag(t,-1);

 D = diag(diag(A));
 L = tril(A,-1);
 U = triu(A,1);
 EJ = -inv(D)*(L+U);
 ES = -inv(D+L)*U;
 disp('Autovalori matrice iterazione Jacobi')
 disp(eig(EJ))

 disp('Autovalori matrice iterazione Gauss-Seidel')
 disp(eig(ES))

 rhoJ = max(abs(eig(EJ)))
 rhoS = max(abs(eig(ES)))