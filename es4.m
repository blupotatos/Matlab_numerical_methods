%es 4 descrivere come cresce errore assoluto usando trapezi e raddoppiando
%subintervalli da 2 fino a 512. descrivere raporti En/E2n con E errori
%assoluti

%definisco funzione
f=@(x) exp(cos(x));

a=0; b=pi/4; 
tol=1e-14;
Ivero=quad(f,a,b,tol);

E_trap=[];

vet=[1:9]; n=length(vet);
NSUB = 2.^vet;                %numero subintervalli

for i=1:n               %esegue l'operazione per i diversi sottointervalli
    
    [x_trap,w_trap, I_trap]=trapezi_composta(NSUB(i),a,b,f);
    E_trap = [E_trap, abs(Ivero - I_trap)];
    
end

rappt=E_trap(1:n-1)./E_trap(2:n);

disp(rappt');

loglog(NSUB, E_trap, 'r-*');
    