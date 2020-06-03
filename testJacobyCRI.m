%risolvere sistema lineare Ax=b con b=ones(3,1)

%perchè jacobi converge? E'DIAGONALMENTE DOMINANTE IN SENSO STRETTO
%ora usare function jacobi con una tolleranza di 1e-8 per test arresto 
%e itmax=200

A=[4 3 0; 2 3 0.5; 0 1 2.5];
b=A*ones(3,1);
itmax=200;
tol=1e-8;
x0=zeros(3,1);

[x,iter,vscarti]=jacobi(A,b,x0,itmax,tol);

% Grafico di convergenza
semilogy(1:iter,vscarti,'bo-','linewidth',2);
legend('Jacobi');
xlabel('iterazioni');ylabel('||scarto||')
title('Profilo di convergenza del  metodo di Jacobi')