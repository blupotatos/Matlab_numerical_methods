f=@(x) x.^2+log(x)+cos(x);
df=@(x) 2*x+1/x-sin(x);
%traccio grafico funzione in [0.2,2] e salvo
figure(1)
fplot(f,[0.2,2],'m-'); hold on
plot([0.2,2],[0,0],'k-'); hold off;
title('f(x)');
print -dpdf grafico.pdf

x0=0.5;
itmax=100;
toll=1e-10;
[xn, itern, scartin]=newton(f,df,x0,toll,itmax);
[xs, iters, scartis]=steffensen(f,x0,toll,itmax);
MN=abs(scartin(end))./scartin(end-1).^2;
MS=abs(scartis(end))./scartis(end-1).^2;
fprintf('newton %5.3f', MN);
fprintf('\n\nstef %5.3f', MS);
zero=fzero(f,1);
disp(zero);

%profili convergenza
figure(2)
semilogy(1:itern, abs(scartin), 'm-*');hold on;
semilogy(1:iters, abs(scartis), 'g-*');
title('profilo convergenza f(x)=0');
xlabel('iterazioni');
ylabel('scarto');
legend('newton', 'steffen');
hold off