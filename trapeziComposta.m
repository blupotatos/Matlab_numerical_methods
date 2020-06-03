function [x,w,ltrap]=trapeziComposta(N,a,b,f)
h=(b-a)/N;        %passo integrazione
x=a:h:b           %nodi integrazione
x=x'              %voglio x come vettore colonna
w=ones(N+1,1);    %inizializzazione vettore pesi
w(1)=w(N+1)=0.5;  %il primo e l'ultimo peso sono metà dei rimanenti
w=w*h;

fx=feval(f,x);    %valutazione funzione nei nodi
Itrap=w'*fx       %valore approssimato della formula dei trapezi composta
end 