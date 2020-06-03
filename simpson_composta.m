function [x,w,Isimp]=simpson_composta(N,a,b,f)
h=(b-a)/N;         %passo integrazione
x=a:h/2:b;           %nodi integrazione
x=x';              %voglio x come vettore colonna
w=ones(2*N+1,1);   %inizializzazione vettore pesi
w(2:2:2*N)=4;
w(3:2:2*N-1)=2;
w=w*h/6;

fx=feval(f,x);    %valutazione funzione nei nodi
Isimp=w'*fx;      %valore approssimato della formula CS composta
end 