%--------------------------------------%
%Definisce la funzione di punto fisso g 
%--------------------------------------%
g=@(x) cos(x);
bis=@(x) x;
figure(1)
fplot(g,[0.5,1],'m-'); hold on
fplot(bis,[0.5,1],'k-'); hold off;
title('cosx versus x');

x0=0.1;
toll= 1e-10;
itmax=100;
% CHIAMATA ALLA FUNCTION PUNTO FISSO
[x,iter,scarti]=pfisso(g,x0,toll,itmax);

asint1=abs(scarti(2:iter)./scarti(1:iter-1));

%Stima della costante asintotica con la formula
dg=@(x) -sin(x);
asint2=abs(feval(dg,x));


% scrive dati su file  
M=[0; asint1];
fid=fopen('rispfisso.txt','w');
fprintf(fid,'   %6s %14s %22s  %17s %17s \n', 'iter', 'xk', 'scarto', 'M (scarti)', 'M (teorica)');
it=[1:iter]; %creo il vettore delle iterazioni
A=[it; x(2:end)'; scarti'; M'; asint2(2:end)'];
fprintf(fid,'\n %8d %19.14f %20.4e %16.6f %16.6f', A);
fprintf(fid,'\n \n');
fclose(fid);

% CHIAMATA ALLA FUNCTION NEWTON
f=@(x) cos(x)-x;
df=@(x) -sin(x)-1;
x0=1;
[xn,itern,scartin]=newton(f,df,x0,toll,itmax);

% crea grafico  con il profilo di convergenza
% di entrambi i metodi nella stessa finestra grafica
figure(2)
semilogy(1:iter, abs(scarti), 'm-*');
title('profilo convergenza g(x)=x and f(x)=g(x)-x=0');
xlabel('iterazioni');
ylabel('scarto');
hold on
semilogy(1:itern, abs(scartin), 'g-+');

print -dpdf confronto.pdf
hold off