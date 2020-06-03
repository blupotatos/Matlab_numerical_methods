%Verifica quale dei due metodi iterativi convergono a  per ogni scelta del punto
%iniziale in [0; 1] (anche graficamente facendo un plot della derivata delle funzioni
%g.. nei due casi)
g1=@(x) sqrt((x.^3+exp(x))./6);
g2=@(x) log(6*x.^2-x.^3);
dg1=@(x) 1/12*1/sqrt((x+exp(x))./6).*(3*x.^2+exp(x));
dg2=@(x) 1/(6*x.^2-x.^3).*(12*x-3*x.^2);
bis=@(x) x;

figure(1)
fplot(dg1,[0,1],'m-'); hold on
fplot(dg2,[0,1],'g-');
plot([0,1],[0,0],'k-');
ylim([-10,20])
title('dg1, dg2');
legend('dg1','dg2');
hold off

x0=0.8;
toll=1e-12;
itmax=100;

[x,iter,scarti]=pfisso(g1,x0,toll,itmax);
asint1=abs(scarti(2:iter)./scarti(1:iter-1));
asint2=abs(feval(dg1,x(end)));
stimaerr=scarti(end)./(1-asint2);

fprintf('n.iterazioni: %i', iter);
fprintf('\nsoluzione: %5f', x(end));
fprintf('\ncostante assintotica sperimentale: %5.3f', asint1(end));
fprintf('\ncostante assintotica teorica: %5.3f', asint2);
fprintf('\nstima errore finale: %5.3e\n\n', stimaerr);

toll2=1e-8;
[xa,itera, scartia]= aitken(g1,x0,toll2,itmax);

asint1atk=abs(scartia(2:itera)./scartia(1:itera-1).^2);

fprintf('n.iterazioni: %i', itera);
fprintf('\nsoluzione: %5f', xa(end));
fprintf('\ncostante assintotica sperimentale: %5.3f\n', asint1atk(end));

figure(2)
semilogy(1:iter, abs(scarti), 'm-*'); hold on
semilogy(1:itera, abs(scartia), 'b-*');
title('profilo convergenza g1(x)=x');
xlabel('iterazioni');
ylabel('scarto');
legend('punto fisso', 'aitken');

print -dpdf raficoes2csi1.pdf
