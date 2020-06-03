function [x,iter,scarti]=pfisso(g,x0,tol,maxit)
%----------------------------------------------------------------
% PUNTO FISSO:  calcola una radice della funzione g definita 
% usando il metodo iterativo del punto fisso
% Test di arresto sullo scarto (dif)
%----------------------------------------------------------------
% [x,iter,scarti]=pfisso(g,x0,tol,maxit)
%----------------------------------------------------------------
% parametri di input: 
%        g: funzione della quale si cerca una radice 
%        x0 = approssimazione iniziale
%        toll: tolleranza  
%        maxit: numero massimo di iterazioni 
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
 while (abs(dif) > tol) & (iter < itmax)
    iter=iter+1;
    xnew=feval(g, xold);
    dif=xnew-xold;
    scarti=[scarti;dif];
    x=[x; xnew];
    xold=xnew;
 end
 if (iter ==itmax)
    disp('raggiunto il numero massimo di iterazioni')
 end
 %costante assintotica dagli scarti
 asint1=abs(scarti(2:iter)./scarti(1:iter-1));
 


