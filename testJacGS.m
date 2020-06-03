%confrontare i 2 metodi GS e Jcobirealizzando profili convergenza
%in un unico grafico

%profilo convergenza
% Definizione della matrice dei coefficienti e del termine noto
A = [4  3  0 ; 2  3  0.5; 0  1  2.5]
n=size(A,1);
b = A*ones(n,1);

%Parametri di ingresso della function jacobi
toll = 1e-8;
itmax= 200;
x0=zeros(n,1);

%Chiamata alla function jacobi
[xJ,iterJ,normscartiJ]=jacobi(A,b,x0,itmax,toll);
%chiamata alla function GS
[xGS,iterGS,normscartiGS]=gaussSiedel(A,b,x0,itmax,toll);

%grafico profilo convergenza
figure(1)
semilogy(1:iterJ, normscartiJ, 'bo-'); hold on
semilogy(1:iterGS, normscartiGS, 'r*-');
xlabel('iterazioni');ylabel('||scarto||');
title('Profilo di convergenza del  metodo di Jacobi e GS');
hold off

