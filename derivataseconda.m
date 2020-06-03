fun = @(x) exp(x) + x + 1;
d2 = @(x) exp(x);
xb = 0.3;
d2vera = d2(xb);
A = [];
n_esponenti = 30;
for esp = 1:n_esponenti
h = 2^(-esp);
xa = xb - h;
xc = xb + h;
d2approx(esp) =  (fun(xc)-2*fun(xb) + fun(xa))/h^2;
err(esp) =  d2approx(esp) - d2vera;
stimaerr(esp) = h^2/12*exp(xc);
end
A =[2.^-([1:n_esponenti]); d2approx; d2vera*ones(1,n_esponenti); err; stimaerr];
fprintf('\n%10s %20s %20s %20s %20s','    h   ','val appross.','valore vero','errore', 'stima err')
fprintf('\n%12.2e %20.12f %20.12f %20.5e %20.5e',A)
fprintf('\n')
semilogy(1:n_esponenti,abs(err),'r-o') 
hold on
semilogy(1:n_esponenti,abs(stimaerr),'b-*') 
hold off
title('Errore nel calcolo della derivata seconda');
xlabel('esponente');
ylabel('valore assoluto dell''errore'); 
legend('Errore assoluto in funzione di h', 'Errore massimo algoritmico');
