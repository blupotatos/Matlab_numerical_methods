function [x,iter, scarti]= pfisso(g,x0,tol,itmax)
% -------------------------------------------------------------------------
% Metodo di Punto fisso
% [xvec,iter, scarti, asint1] =pfisso(g,x0,epsilon,itmax)
% -------- OUTPUT VARIABLES -----------
% scarti: vettore degli scarti (scarti(i) = xk+1 -xk)
% x: vettore contenente le approssimazioni del punto fisso calcolate
% iter: numero di iterazioni 
% asint1: vettore che approssimazione il fattore di convergenza M usando 
%           il rapporto tra due scarti successivi
% -------- INPUT VARIABLES ------------
% g: funzione
% x0: punto iniziale
% tol: tolleranza richiesta per il test sullo scarto
% itmax: numero massimo di iterazioni consentito
% -------------------------------------------------------------------------

xold=x0;
x=[x0];
iter=0;
dif=tol+1;
scarti=[];
while abs(dif)>tol & iter<itmax
     iter=iter+1;
     xnew=feval(g,xold);
     x=[x;xnew];
     dif=xnew-xold;
     scarti=[scarti;dif];
     xold=xnew; 
end


if iter==itmax 
    disp('Raggiunto il massimo numero di iterazioni');
end