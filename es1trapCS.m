%funzione integranda
f=@(x) exp(x-2).*sin(x);
%estremi integrazione e tolleranza
a=1;b=3;
tol=1e-14;

%valore vero
Ivero=quad(f,a,b,tol);

fid=fopen('integralees1.txt','w');

%valori approssimati trapezi composta nval=11:10:201
for nval=11:10:201
    fprintf(fid, '\n %8s %16s %16s %14s %16s %14s %14s ','NODI', 'I_TRAP', 'ERR.',...
     'ERR. REL','I_SIMPSON','ERR','ERR. REL'  );
% NUMERO SUBINTERVALLI PER TRAPEZI COMPOSTA.
   N_trap=nval-1;        
   [x_trap,w_trap, I_trap]=trapezi_composta(N_trap,a,b,f);

 % NUMERO SUBINTERVALLI PER CAV.SIMPSON COMPOSTA.
   N_simpson=(nval-1)/2; 
   [x_simp,w_simp, I_simp]=simpson_composta(N_simpson,a,b,f);


 % CALCOLO DEGLI ERRORI ASSOLUTI
   E_trap = abs(Ivero - I_trap);
   E_simp = abs(Ivero - I_simp);
   
%  STAMPA DEI VALORI APPROSSIMATI E DEGLI ERRORI RELATIVI! 
   fprintf(fid, ' \n %7d %20.14f %12.3E %12.3E  %18.14f %13.3E %13.3E \n',nval,I_trap, E_trap,E_trap/Ivero,I_simp, E_simp,E_simp/Ivero);
   
%END DEL CICLO FOR
end

fclose(fid);
