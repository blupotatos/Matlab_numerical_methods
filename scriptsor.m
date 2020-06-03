%risolvere Ax=b con b t.c. x=ones(5,1) con J,GS,SOR con w=1.4. 
%tol 10-10 e itmax 200 x0=0 0 0... Unico grafico profili convergenza.

A=2*diag(ones(5,1))-diag(ones(4,1),-1)-diag(ones(4,1),1);

tol=1e-10; itmax=200; omega=1.4;
x0=zeros(5,1);

b=A*ones(5,1);

[xJ,iterJ,normscartiJ]=jacobi(A,b,x0,itmax,tol);
[xGS,iterGS,normscartiGS]=gaussSiedel(A,b,x0,itmax,tol);
[xSOR,iterSOR,normscartiSOR]=sor(A,b,x0,itmax,tol,omega);

%grafico profilo convergenza
figure(1)
semilogy(1:iterJ, normscartiJ, 'bo-'); hold on
semilogy(1:iterGS, normscartiGS, 'r*-');
legend('jacobi', 'GS');
xlabel('iterazioni');ylabel('||scarto||');
title('Profilo di convergenza del  metodo di Jacobi e GS');
hold off

%stima costante asintotica J e GS
asintJ=normscartiJ(2:iterJ)./normscartiJ(1:iterJ-1);
%osservo che in jacobi asint oscilla
figure(3)
plot(asintJ, 2:iterJ, 'b-');
hold off;

%autovalori EJ
D = diag(diag(A));
L = tril(A,-1);
U = triu(A,1);
EJ = -inv(D)*(L+U);
disp('Autovalori matrice iterazione Jacobi')
disp(eig(EJ))

%th young-varga verificato
%1)biciclica coerentemente ordinata
%2)autovalori tutti reali
%3)jacobi converge infatti raggio spettrale(max valore assoluto autoval) <1

rho=max(abs(eig(EJ)));
disp('raggio spettrale')
disp(rho)

%metodo SOR con vari w
rhoSOR=[];

for omega=0:0.1:10
M = omega*L+D;
N = (1-omega)*D-omega*U;
ES=inv(M)*N;
rhoSOR=[rhoSOR, max(abs(eig(ES)))];
end

figure(2)
title('cerco raggio spettrale minimo metodo SOR');
plot(0:0.1:10, rhoSOR, 'b-');
xlabel('omega');
ylabel('rho(Esor');
hold off

%calcolo omega ottimo teorico
omegaOpt=2/(1+sqrt(1-rho^2));
disp('omega ottimo teorico')
disp(omegaOpt)


