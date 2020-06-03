% SCRIPT PER CHIAMARE LE FORMULE DI QUADRATURA COMPOSTE

% FUNZIONE INTEGRANDA
% caso a
f=@(x) x.^20;
% INTERVALLO D'INTEGRAZIONE
% caso a
a=-1; b=1; 

% Valore vero dell'integrale definito 
Ivero=2/21;

% APERTURA FILE DI RISULTATI 
fid=fopen('integrale.txt','w');


nval=[11 51 101 301 501]; %numero valutazioni funzione
% CICLO FOR
for i=1:length(nval)
% INTESTAZIONE TABELLA RISULTATI
fprintf(fid,'\n %8s %16s %12s %18s %15s ','NODI', 'I_TRAP', 'ERR. REL' ,...
 'I_SIMPSON','ERR. REL'  );


% Numero di valutazioni di funzione
         % OCCHIO: NON E' IL NUMERO DI SUBINTERVALLI!!!!!!!

 % NUMERO SUBINTERVALLI PER TRAPEZI COMPOSTA.
   N_trap=nval(i)-1;        
   [x_trap,w_trap, I_trap]=trapezi_composta(N_trap,a,b,f);

 % NUMERO SUBINTERVALLI PER CAV.SIMPSON COMPOSTA.
   N_simpson=(nval(i)-1)/2; 
   [x_simp,w_simp, I_simp]=simpson_composta(N_simpson,a,b,f);


 % CALCOLO DEGLI ERRORI ASSOLUTI
   E_trap = abs(Ivero - I_trap);
   E_simp = abs(Ivero - I_simp);
   
%  STAMPA DEI VALORI APPROSSIMATI E DEGLI ERRORI RELATIVI! 
   fprintf(fid,' \n %7d %20.14f %12.3E  %18.14f %13.3E \n',nval(i),I_trap,E_trap/Ivero,I_simp,E_simp/Ivero);
   
%END DEL CICLO FOR
end
fclose(fid);

% Si ricordi di modificare l'istruzione fprintf per stampare su file
%   fprintf(fid,' \n %7d %20.14f %12.3E  %18.14f %13.3E',nval,I_trap,E_trap,I_simp,E_simp);