%rapporto tra errori relativi commessi in regola trapezi e CS 
%raddoppiando gli intervalli da 2 fino a 512

%definisco la funzione integranda
f=@(x) exp(x-2).*sin(sqrt(x));
a=1; b=4;
tol=1e-14;
err_rel_t=[];
err_rel_s=[];

Ivero=quad(f,a,b,tol);

vet=[1:9]; n=length(vet);
NSUB=2.^vet;                  %numero subintervalli per T e CS

for i=1:n
    [x_trap,w_trap, I_trap]=trapezi_composta(NSUB(i),a,b,f);
    [x_simp,w_simp, I_simp]=simpson_composta(NSUB(i),a,b,f);
    % CALCOLO DEGLI ERRORI ASSOLUTI
    E_trap = abs(Ivero - I_trap);
    E_simp = abs(Ivero - I_simp);
   
    err_rel_t=[err_rel_t, E_trap/Ivero];
    err_rel_s=[err_rel_s, E_simp/Ivero];
end

%rapporto tra errori relativi
rappt=err_rel_t(1:n-1)./err_rel_t(2:n);
rapps=err_rel_s(1:n-1)./err_rel_s(2:n);

disp('trapezi');
fprintf('%12.5f\n', rappt);
fprintf('\n\n');
disp('Cavalieri-Simpson:');
fprintf('%12.5f\n', rapps);
fprintf('\n');

%OSSERVO CHE PER TRAPEZI RAPPORTO TENDE A 4 
%PER CS RAPPORTO TENDE A 16
%se cambio intervallo integrazione [0,1] ottengo x entrambi rapporto
%circa2.8