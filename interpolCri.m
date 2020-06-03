function t=interpol(x,y,s)
%x,y coordinate punti sperimentali
%s punti in cui viene valutato il polinomio
%mi esce il vettore t come output contenente y(sk) ossia 
%i valori che assume il polinomio nei punti s
grado=length(x)-1;
coeff=polyfit(x,y,grado);
t=polyval(coeff,s);

