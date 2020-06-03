f = @(x) x.^2 - 2;
df = @(x) 2*x;
%grafico della funzione e dell'asse x nell'intervallo [a, b]
a = -3; b = 3;
fplot(f, [a, b]); 
hold on
plot([a, b],[0,0], 'k-');
hold off

x0 = 2;
tol=1e-8;
maxiter = 100;
[x, scarti, iter] = newtonCri( f, df, x0, tol, maxiter)