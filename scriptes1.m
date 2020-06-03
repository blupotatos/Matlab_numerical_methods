f=@(x) x.^3-6*x.^2+exp(x);
df=@(x) 3*x.^2-12*x+exp(x);
%grafico della funzione e dell’asse x nell’intervallo [0; 4]
figure(1)
fplot(f,[0,4]); hold on
plot([0,4], [0,0], 'k-');
hold off
print -dpdf graficoes1funzione.pdf
%Verifica esistenza di una soluzione in [0; 1] e una in [3,4]
if (feval(f,0)*feval(f,1) < 0)&(feval(f,3)*feval(f,4) < 0 )
    disp('esiste sicuramente una soluzione in [0,1] e una in [3,4]')
else
    disp('in almeno uno dei due intervalli non vi è alcuno zero')
    return;
end
%approssimare il primo zero con Newton-Raphson e stima di M con gli scarti
x0=0.8;
tol=1e-8;
maxit=100;
[x1, iter1, scarti1] = newton(f, df, x0, tol, maxit);
M=abs(scarti1(end))/scarti1(end-1).^2;
fprintf('METODO DI NEWTON')
fprintf('\n Numero iterazioni: %i', iter1)
fprintf('\n Soluzione primo zero: %f', x1(end))
fprintf('\n Costante assintotica: %f \n', M)
%utilizzando steffenson(ordine convergenza 2):
[x1st, iter1st, scarti1st] = steffensen(f, x0, tol, maxit);
Mst=abs(scarti1st(end))/scarti1st(end-1).^2;
fprintf('\n MEDODO DI STEFFENSEN')
fprintf('\n Numero iterazioni: %i', iter1st)
fprintf('\n Soluzione primo zero: %f', x1st(end))
fprintf('\n Costante assintotica: %f \n\n', Mst)
%verifica convergenza metodo tangente fissa con punto iniziale x0(M<1)
Mtg_teorico=abs(1-feval(df,x1(end))/feval(df,x0));
if  Mtg_teorico< 1
    disp('il metodo della tangente fissa converge se x0=0.8')
else
    disp('il metodo della tangente fissa NON converge se x0=0.8')
    return;
end
%utilizzare tangente fissa(se converge)
[x1tg, iter1tg, scarti1tg] = tfissa(f, df, x0, tol, maxit);
Mtg_sperimentale =abs(scarti1tg(end)/scarti1tg(end-1));
fprintf('MEDODO TANGENTE FISSA')
fprintf('\n Numero iterazioni: %i', iter1tg)
fprintf('\n Soluzione primo zero: %f', x1tg(end))
fprintf('\n Costante assintotica teorica: %f', Mtg_teorico)
fprintf('\n Costante assintotica dagli scarti: %f \n\n', Mtg_sperimentale)    
%profili convergenza
figure(2)
semilogy(1:iter1, abs(scarti1), 'm-*'); hold on
semilogy(1:iter1st, abs(scarti1st), 'b-o');
semilogy(1:iter1tg, abs(scarti1tg), 'g-+');
title('profilo convergenza');
xlabel('iterazioni');
ylabel('scarto');
legend('Newton', 'Steffensen', 'tangente fissa');
%creazione PDF
print -dpdf graficoes1csi1.pdf
hold off
%-------------------------------------------------------------------------
%stessa cosa per csi2 (facoltativo)
%-------------------------------------------------------------------------
x02=3.5;  
[x2, iter2, scarti2] = newton(f, df, x02, tol, maxit);
M2=abs(scarti2(end))/scarti2(end-1).^2;
fprintf('METODO DI NEWTON')
fprintf('\n Numero iterazioni: %i', iter2)
fprintf('\n Soluzione secondo zero: %f', x2(end))
fprintf('\n Costante assintotica: %f \n', M2)
%utilizzando steffenson(ordine convergenza 2):
[x2st, iter2st, scarti2st] = steffensen(f, x02, tol, maxit);
Mst2=abs(scarti2st(end))/scarti2st(end-1).^2;
fprintf('\n MEDODO DI STEFFENSEN')
fprintf('\n Numero iterazioni: %i', iter2st)
fprintf('\n Soluzione secondo zero: %f', x2st(end))
fprintf('\n Costante assintotica: %f \n\n', Mst2)
%verifica convergenza metodo tangente fissa con punto iniziale x02(M<1)
Mtg_teorico2=abs(1-feval(df,x2(end))/feval(df,x02));
if  Mtg_teorico2< 1
    disp('il metodo della tangente fissa converge se x0=3.5')
else
    disp('il metodo della tangente fissa NON converge se x0=3.5')
    return;
end
%utilizzare tangente fissa(se converge)
[x2tg, iter2tg, scarti2tg] = tfissa(f, df, x02, tol, maxit);
Mtg_sperimentale2 =abs(scarti2tg(end)/scarti2tg(end-1));
fprintf('MEDODO TANGENTE FISSA')
fprintf('\n Numero iterazioni: %i', iter2tg)
fprintf('\n Soluzione secondo zero: %f', x2tg(end))
fprintf('\n Costante assintotica teorica: %f', Mtg_teorico2)
fprintf('\n Costante assintotica dagli scarti: %f \n\n', Mtg_sperimentale2)    
%profili convergenza
figure(3)
semilogy(1:iter2, abs(scarti2), 'm-*'); hold on
semilogy(1:iter2st, abs(scarti2st), 'b-o');
semilogy(1:iter2tg, abs(scarti2tg), 'g-+');
title('profilo convergenza');
xlabel('iterazioni');
ylabel('scarto');
legend('Newton', 'Steffensen', 'tangente fissa');
%creazione PDF
print -dpdf graficoes1csi2.pdf
%-----------------------------------------------------------------------
%usare xo=2.44 sia per Newton che Stephenson
%-----------------------------------------------------------------------
x03=2.44;
[x3, iter3, scarti3] = newton(f, df, x03, tol, maxit);
M3=abs(scarti3(end))/scarti3(end-1).^2;
fprintf('METODO DI NEWTON')
fprintf('\n Numero iterazioni: %i', iter3)
fprintf('\n Soluzione se xo=2.44: %f', x3(end))
fprintf('\n Costante assintotica: %f \n', M3)
%utilizzando steffenson(ordine convergenza 2):
[x3st, iter3st, scarti3st] = steffensen(f, x03, tol, maxit);
Mst3=abs(scarti3st(end))/scarti3st(end-1).^2;
fprintf('\n MEDODO DI STEFFENSEN')
fprintf('\n Numero iterazioni: %i', iter3st)
fprintf('\n Soluzione se xo=2.44: %f', x3st(end))
fprintf('\n Costante assintotica: %f \n\n', Mst3)



    