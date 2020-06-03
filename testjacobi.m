%-------------------------------------------------------%
%     SCRIPT PER USARE IL METODO ITERATIVO DI JACOBI    %
%-------------------------------------------------------%

% Definizione della matrice dei coefficienti e del termine noto
A = [4  3  0 ; 2  3  0.5; 0  1  2.5]
n=size(A,1);
b = A*ones(n,1);

%Parametri di ingresso della function jacobi
toll = 1e-8;
itmax= 200;
x0=zeros(n,1);

%Chiamata alla function jacobi
[x,iterjac,normscartijac]=jacobi(A,b,x0,itmax,toll);
iterjac
x

% Grafico di convergenza
semilogy(1:iterjac,normscartijac,'bo-','linewidth',2);
legend('Jacobi');
xlabel('iterazioni');ylabel('||scarto||')
title('Profilo di convergenza del  metodo di Jacobi')