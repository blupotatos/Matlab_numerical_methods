function [x,iter,scarti]=seccante(f,x0, x1,tol,itmax)
%----------------------------------------------------------------
% SECCANTE:  calcola una radice della funzione f definita 
% usando il metodo iterativo della seccante variabile
% Test di arresto sullo scarto (dif)
%----------------------------------------------------------------
% [x,iter,scarti]=seccante(f,x0, x1, tol,itmax)
%----------------------------------------------------------------
% parametri di input: 
%        f: funzione della quale si cerca una radice 
%        x0 = primo punto per approssimazione iniziale
%        x1 = secondo punto per approssimazione iniziale
%        toll: tolleranza  
%        itmax: numero massimo di iterazioni 
% parametri di output: 
%        x: vettore delle approssimazione della radice 
%        iter:  numero di iterazioni effettuate
%        scarti: vettore degli scarti successivi
%----------------------------------------------------------------
 xold0=x0;
 xold1=x1;
 x=[x0; x1];
 scarti=[];
 dif=tol+1;
 iter=0;
 while (abs(dif) > tol) & (iter < itmax)
    fx=feval(f,xold1);
    if fx == 0 return; end
    cx=(fx-feval(f, xold0))/(xold1-xold0);
    if cx == 0 
       disp('ERRORE: retta parallela all asse x'); return; 
    end
    iter=iter+1;
    dif=-fx/cx;
    xnew=xold1+dif;
    scarti=[scarti;dif];
    x=[x; xnew];
    xold0=xold1;
    xold1=xnew;
 end
 if (iter >=itmax)
    disp('raggiunto il numero massimo di iterazioni')
 end


