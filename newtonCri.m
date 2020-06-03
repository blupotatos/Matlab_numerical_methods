%FUNZIONE NEWTON-RAPHSON
%------------------------------------------------------------------
%INPUT:
%f funzione di iterazione 
%df derivata prima 
%x0 punto iniziale
%tol tolleranza
%itmax numero massimo iterazioni
%------------------------------------------------------------------
%OUTPUT
%x vettore con le approssimazioni dello zero e ottenute ad ogni passo
%scarti vettore con il valore dello scarto(abs tra 2 approssimazioni)
%iter numero di iterazioni a convergenza
%-------------------------------------------------------------------

function[x, scarti, iter] = newton(f, df, x0, tol, itmax)
    x = [x0]'; 
    scarti = []';   %definisco x e scarti come vettori
    iter = 0;      %inizializazione variabile da confrontare con itmax
    i = 1;
    flag = 1;
    while (flag==1) & (iter < itmax)
        if feval(f, x(i)) == 0 return; end;
        if feval(df, x(i)) == 0
            disp('minchione la derivata è nulla');
        return; end;
        x(i+1) = x(i) - feval(f, x(i))/feval(df, x(i));
        scarti(i) = abs(x(i+1)-x(i));
        flag = scarti(i) > tol;
        i = i + 1;   %iter = i - 1
        iter = i - 1;
    end
    if(iter >= itmax) 
        disp('raggiunti il massimo numero di iterazioni')
    end
        