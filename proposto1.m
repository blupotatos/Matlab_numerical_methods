% ESERCIZIO PROPOSTO NUMERO 1
% FUNZIONE INTEGRANDA
f=@(x) exp(x-2).*sin(x);
% INTERVALLO D'INTEGRAZIONE
% Caso a
a=1; b=3; 

figure(1);
fplot(f,[a b]);
title('Funzione integranda')

% Valore vero dell'integrale definito
Ivero=quad(f,a,b,1e-14);

% APERTURA FILE DI RISULTATI E INTESTAZIONE TABELLA
fid=fopen('tabellaquad1.ris','w');
% INTESTAZIONE TABELLA CON SPACING PER VI
%fprintf(fid,'\n %8s %15s %16s %15s %18s ','NODI', 'I_TRAP', 'ERR. REL' ,...
% 'I_SIMPSON','ERR. REL'  );
% INTESTAZIONE TABELLA CON SPACING MATLAB
fprintf(fid,'\n %8s %15s %16s %17s %15s ','NODI', 'I_TRAP', 'ERR. REL' ,...
 'I_SIMPSON','ERR. REL'  );
err_rel_t=[];
err_rel_s=[];

% NUMERO DI NODI DEVE ESSERE DISPARI (per Cav. Simpson)
valori=11:10:201; 

for nval=valori

   % NUMERO SUBINTERVALLI PER TRAPEZI COMPOSTA.
   N_trap=nval-1;        
   [x_trap,w_trap, I_trap]=trapezi_composta(N_trap,a,b,f);

   % NUMERO SUBINTERVALLI PER CAV.SIMPSON COMPOSTA.
   N_simpson=(nval-1)/2; 
   [x_simp,w_simp, I_simp]=simpson_composta(N_simpson,a,b,f);


   % CALCOLO DEGLI ERRORI RELATIVI
   E_trap = abs((Ivero - I_trap)/Ivero);
   E_simp = abs((Ivero - I_simp)/Ivero);
   % SCRITTURA SUL VETTORE
   err_rel_t=[err_rel_t;E_trap];
   err_rel_s=[err_rel_s;E_simp];
%   fprintf(' \n %7d %20.14f %12.3E  %18.14f %13.3E',nval,I_trap,E_trap,I_simp,E_simp);
   fprintf(fid,' \n %7d %20.14f %12.3E  %18.14f %13.3E',nval,I_trap,...
       E_trap,I_simp,E_simp);
end
%   fprintf(' \n');
fprintf(fid,' \n');
fclose(fid);

% GRAFICO DEGLI ERRORI RELATIVI IN FUNZIONE DEL NUM. NODI (NVAL)
figure(2);
%semilogy(valori,err_rel_t,valori,err_rel_s,'r-');
loglog(valori,err_rel_t,valori,err_rel_s,'r-');
legend('Trapezi','Simpson');
title('Errori relativi formule composte');
xlabel('numero di nodi ');
ylabel('Errore relativo');
legend('Trapezi','Simpson');
