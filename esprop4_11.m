%Ax=b con x= ones(4,1). 
%risolvere con J e GS e produrre unico grafico con profilo convergenza
%stimare costante assintotica sperimentalmente
%calcolare gli autovalori di EJ e dire se sono verificate ipotesi young
%varga. Risolvere con SOR e diversi valori di w

A=[4 0 -1 -2; 0 -1 -1 -0.5; -0.5 -1 3 0; -1 -1 0 4];
%è biciclica perchè 
%è coerentemente ordinata perchè

itmax=100; tol=1e-8; x0=zeros(4,1);

[xJ,iterJ,normscartiJ]=jacobi(A,b,x0,itmax,tol);
[xGS,iterGS,normscartiGS]=gaussSiedel(A,b,x0,itmax,tol);

%grafico profilo convergenza J e GS
figure(1)
semilogy(1:iterJ, normscartiJ, 'bo-'); hold on
semilogy(1:iterGS, normscartiGS, 'r*-');
hold off;

