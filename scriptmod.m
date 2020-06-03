f=@(x) (x-1).^2*log(x);
df=@(x) 2*(x-1)*log(x)+(x-1).^2/x;
tol=1e-9;
x0=3;
itmax=100;
%applico newton prima immodificato(r=1) poi modificato con r=3 a f(x)
[x1, iter1, scarti1] = newtonmod(f, df, 1, x0, tol, itmax);
[x3, iter3, scarti3] = newtonmod(f, df, 3, x0, tol, itmax);
%grafico semilogaritmico degli scarti in funzione delle iterazioni
semilogy(1:iter1, abs(scarti1), 'm-*'); hold on
semilogy(1:iter3, abs(scarti3), 'b-*');
title('profilo convergenza');
xlabel('iterazioni');
ylabel('scarto');
legend('r=1', 'r=3');
hold off