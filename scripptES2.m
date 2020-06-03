f=@(x) x.^3+sin(x)-exp(x);
%1)plot of the function above within [-1,2]
figure(1)
fplot(f, [-1, 2]); hold on
plot([-1,2],[0,0],'k-'); hold off
%2)solve the equation using the Newton method 
%xo=2    maxiter=100  tol=1e-7 
%Nvet_sol := vettore soluzioni
%Niterazioni := numero iterazioni eseguite
%Nvet_scarti := vettore scarti
df=@(x) 3*x.^2+cos(x)-exp(-x);
x0 = 2;
tol = 1e-7;
maxiter = 100;
[Nvet_sol, Niterazioni, Nvet_scarti] = newton(f,df,x0,tol,maxiter);
%3)solve the equation using seccante variabile
x1 = Nvet_sol(2);
[Svet_sol, Siterazioni, Svet_scarti] = seccante(f,x0,x1,tol,maxiter);
%4)asymptotic constant and final error 
% NM := Vector for Newton asymptotic constant
% Nerr := error in the last itaration for Newton method
% SM := Vector for Secant method asymptotic constant
% Serr := error in the last itaration for Secant method
NM = abs(Nvet_scarti(2:Niterazioni))./(Nvet_scarti(1:Niterazioni-1)).^2;
SM=abs(Svet_scarti(2:Siterazioni))./abs(Svet_scarti(1:Siterazioni-1)).^1.618;
Nerr = NM(end)*(Nvet_scarti(end))^2;
Serr = SM(end)*abs(Svet_scarti(end))^1.618;
%5)semilogarithmic plot of the convergence profile
figure(2)
semilogy(1:Niterazioni, abs(Nvet_scarti), 'm-*'); hold on
semilogy(1:Siterazioni, abs(Svet_scarti), 'b-*');
title('profilo convergenza');
xlabel('iterazioni');
ylabel('scarto');
legend('Newton', 'Seccante');
hold off
%save file PDF
print -dpdf graficoEs2.pdf