g=@(x) (exp(x)+2).^(1/3);
dg=@(x) 1/3*(exp(x)+2).^(-2/3).*exp(x);
bis=@(x) x;
figure(1)
fplot(g,[2,2.5],'m-'); hold on
fplot(bis,[2,2.5],'k-');
plot([2,2.5],[0,0],'k-');
title('(exp(x)+2).^(1/3) versus x');
hold off

x0=2;
toll= 1e-12;
itmax=100;
% CHIAMATA ALLA FUNCTION PUNTO FISSO
[x,iter,scarti]=pfisso(g,x0,toll,itmax);

asint1=abs(scarti(2:iter)./scarti(1:iter-1));
asint2=abs(feval(dg,x));

%riporto ordinatamente i dati in file di testo
M=[0; asint1];
fid=fopen('rispfisso_2.txt','w');
fprintf(fid,'   %6s %14s %22s  %17s %17s \n', 'iter', 'xk', 'scarto', 'M (scarti)', 'M (teorica)');
it=[1:iter]; %creo il vettore delle iterazioni
A=[it; x(2:end)'; scarti'; M'; asint2(2:end)'];
fprintf(fid,'\n %8d %19.14f %20.4e %16.6f %16.6f', A);
fprintf(fid,'\n \n');
fclose(fid);

% crea grafico  con il profilo di convergenza
% di punto fisso 
figure(2)
semilogy(1:iter, abs(scarti), 'm-*');
title('profilo convergenza g(x)=x');
xlabel('iterazioni');
ylabel('scarto');
hold off