%risolvere con jacobi Ax=b 
%calcolare velocità convergenza R=-log10(raggio spettrale matr.iter E)
%stimare numero iterazione per avere errore di norma inferiore a 10-9 e
%confrontare tale numero con quello del numero di iterazioni di Jacobi

n=9;
A=4*diag(ones(n,1))-diag(ones(n-1,1),-1)-diag(ones(n-1,1),1)...
    -diag(ones(n-3,1),-3)-diag(ones(n-3,1),3);
A(3,4)=0;
A(4,3)=0;
A(6,7)=0;
A(7,6)=0;
%b con componenti t.c. x= 1 1 1...
b=A*ones(n,1);

tol=1e-9; itmax=200;
x0=zeros(n,1);

[xJ,iterJ,normscartiJ]=jacobi(A,b,x0,itmax,tol);
disp(xJ);

%calcolo E e raggio spettrale di E
D = diag(diag(A));
L = tril(A,-1);
U = triu(A,1);
EJ = -inv(D)*(L+U);
disp('Autovalori matrice iterazione Jacobi')
disp(eig(EJ))

rho_J = max(abs(eig(EJ)))
R=-log10(rho_J);

fprintf('numero iterazzioni Jacobi %d \n', iterJ);

%stima iterazioni necessarie
m=9;
k=m/R;
fprintf('numero iterazzioni minime Jacobi stimate: %.1f \n', k);