%es2mod con n=2^k suddivisioni e k=2,3...10

fid=fopen('integrale3_T_CS_R.txt','w');
fprintf(fid, '\n%7s %16s %16s %14s %16s %14s %14s ','N', 'I_TRAP', 'ERR.ASS',...
     'I_SIMPSON','ERR.ASS','I_RICH', 'ERR.ASS'  );

%definisco la funzione integranda
f=@(x) exp(x-2).*sin(sqrt(x));
a=1; b=4;
tol=1e-14;
E_trap=[];
E_simp=[];
E_rich=[0];
I_rich=[0];

Ivero=quad(f,a,b,tol);

for k=1:10
    n=2.^k;
    [x_trap,w_trap, I_trap]=trapezi_composta(n,a,b,f);
    [x_simp,w_simp, I_simp]=simpson_composta(n,a,b,f);
    
    %vettore contenente estrapolazione richardson su CS
    if k>1    
    I_rich=[I_rich, 1/15*(16*I_simp-I_simp_old)];
    E_rich = [E_rich, abs(Ivero - I_rich)];
    end
    
    % CALCOLO vettore DEGLI ERRORI ASSOLUTI
    E_trap = [E_trap, abs(Ivero - I_trap)];
    E_simp = [E_simp, abs(Ivero - I_simp)];
  
        
       
    I_simp_old=I_simp;
    
    fprintf(fid, ' \n %7d %20.14f %12.2E %18.14f %13.2E %16.14f %13.2E\n',n ,I_trap, E_trap(end), I_simp, E_simp(end), I_rich(end), E_rich(end));
    
end

fid(close);