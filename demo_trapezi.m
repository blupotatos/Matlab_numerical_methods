% SCRIPT TO CALL THE COMPOSITE KEYSTONE FUNCTION

% Integranda function
f=@(x)x.^20;

% Integration interval
a=-1; b=1; 


N_trap=3;  % NUMBER OF SUB-INTERVALS FOR COMPOUND KEYSTONE.
[x_trap,w_trap, Itrap]=trapezi_composta(N_trap,a,b,f);

format long
Itrap

disp('valore vero dell''integrale definito');
Ivero=2/21

%disp(['Errore relativo con ', num2str(N_trap), '   subintervalli']);
disp('Errore relativo');
Etrap=abs((Ivero-Itrap)/Ivero)