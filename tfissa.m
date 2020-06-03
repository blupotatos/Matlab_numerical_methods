function [x,iter,scarti]=tfissa(f,df,x0,tol,itmax)
%----------------------------------------------------------------
% TFISSA:  calcola una radice della funzione f definita 
% usando il metodo iterativo della tangente fissa
% Test di arresto sullo scarto (dif)
%----------------------------------------------------------------
% [x,iter,scarti]=tfissa(f,df,x0,tol,itmax)
%----------------------------------------------------------------
% parametri di input: 
%        f: funzione della quale si cerca una radice 
%        d: derivata prima di f
%        x0 = approssimazione iniziale
%        toll: tolleranza  
%        itmax: numero massimo di iterazioni 
% parametri di output: 
%        x: vettore delle approssimazione della radice 
%        iter:  numero di iterazioni effettuate
%        scarti: vettore degli scarti successivi
%----------------------------------------------------------------

 xold=x0;
 x=[x0];
 scarti=[];
 dif=tol+1;
 iter=0;
 %valuta la tangente nel punto inixiale x0
 dfx=feval(df,x0);
    if dfx == 0 
       disp('ERRORE: derivata nulla.'); return; end;
 while (abs(dif) > tol) & (iter < itmax)
    fx=feval(f,xold);
    if fx == 0 return; end
    iter=iter+1;
    dif=-fx/dfx;
    xnew=xold+dif;
    scarti=[scarti;dif];
    x=[x; xnew];
    xold=xnew;
 if (iter >=itmax)
    disp('raggiunto il numero massimo di iterazioni')
 end
 end

