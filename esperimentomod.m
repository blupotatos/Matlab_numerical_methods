fid=fopen('runge.txt','w');
% DEFINIZIONE DELLA FUNZIONE DI RUNGE
runge=@(x) 1./(x.^2+1);
% GRADI DEL POLINOMIO DI INTERPOLAZIONE.
for n=1:31

% Intervallo [a,b]
a=-5;b=5;

% NODI TEST (dove valutare l'interpolante)
s=linspace(a,b);

% CALCOLO DEI NODI EQUISPAZIATI. ASCISSE/ORDINATE 
x=a:(b-a)/n:b; y=runge(x);   

% CALCOLO E VALUTAZIONE DELL'INTERPOLANTE NODI EQUIS.
t=interpol(x,y,s); %Oppure polyfit e polyval 

% CALCOLO DEI NODI di Gauss-Chebyshev-Lobatto. ASCISSE/ORDINATE
xgcl=chebgausslob(a,b,n+1); ygcl=runge(xgcl);

% CALCOLO E VALUTAZIONE DELL'INTERPOLANTE SU NODI DI GAUSS
tt =interpol(xgcl, ygcl,s);  

% PLOT INTERPOLANTI VS FUNZIONE DI RUNGE.
plot(s,runge(s),'r-','Linewidth',2);
hold on;
plot(s,t,s,tt); hold off; 
legend('Runge','EQUIS','GAUSS')

% CALCOLO E SCRITTURA A VIDEO DEGLI ERRORI ASSOLUTI (in norma infinito).
ee=norm(runge(s)-t,inf);ec=norm(runge(s)-tt,inf); 

fprintf(fid,'\n\t [GRADO]: %3.0f[ERR.][EQS]:%2.2e [GCL]:%2.2e',n,ee,ec);
fprintf(fid,'\n');

end
fclose(fid);