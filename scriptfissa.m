f=@(x) exp(-x)+cos(x)-3;
df=@(x) -exp(-x)-sin(x);
x0=-1;
itmax=100;
tol= 1e-9;
[Nx,Niter,Nscarti]=newton(f,df,x0,tol,itmax);
[Tx,Titer,Tscarti]=tfissa(f,df,x0,tol,itmax);
%profilo convergenza
semilogy(1:Niter, abs(Nscarti), 'm-+'); hold on
semilogy(1:Titer, abs(Tscarti), 'b-+');
title('profilo convergenza');
xlabel('iterazioni');
ylabel('scarto');
legend('newton', 'tangente fissa');
hold off
print -dpdf graficotf.pdf
%costante assintotica M tangente fissa
M = abs(Tscarti(end)/Tscarti(end-1));