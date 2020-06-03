%modifica del es1trapCS in modo da ottenere grafico logaritmico errori
%relativi in funzione del numero di nodi(nval)

%funzione integranda
f=@(x) exp(x-2).*sin(x);
%estremi integrazione e tolleranza
a=1;b=3;
tol=1e-14;

%valore vero
Ivero=quad(f,a,b,tol);
%vettori erroli relativi
err_rel_t=[];
err_rel_s=[];

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
   
   err_rel_t=[err_rel_t, E_trap/Ivero];
   err_rel_s=[err_rel_s, E_simp/Ivero];
   
%  STAMPA DEI VALORI APPROSSIMATI E DEGLI ERRORI RELATIVI! 
   fprintf(fid, ' \n %7d %20.14f %12.3E %12.3E  %18.14f %13.3E %13.3E \n',nval,I_trap, E_trap,E_trap/Ivero,I_simp, E_simp,E_simp/Ivero);
   
%END DEL CICLO FOR
end

fclose(fid);

%grafico errori relativi in funzione nval
loglog(11:10:201, err_rel_t, 'r-*'); hold on;
loglog(11:10:201, err_rel_s, 'g-+');
legend('trapezi','cavalieri-simpson');
xlabel('nval');
ylabel('err-rel');
print -dpdf errelativoexp(x-2)sin(x).pdf