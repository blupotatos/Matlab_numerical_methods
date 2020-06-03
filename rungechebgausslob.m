% --------------------------------------------------------------------
% INTERPOLAZIONE DELLA FUNZIONE DI RUNGE 
% --- SU NODI DI CHEBYSHEV-GAUSS-LOBATTO NELL'INTERVALLO [-5,5] 
% CREAZIONE DELL'INTERPOLANTE DI GRADO 6,8,10,15 (4 valori in tutto)
% --------------------------------------------------------------------

%Definizione della funzione di Runge
f = @(x)(1./(1+x.^2))
grado = [6 8 10 15];

% xval: CONTIENE I PUNTI DOVE VALUTARE LA FUNZIONE E I DIVERSI  INTERPOLANTI
xval = linspace(-5,5); % di default crea 100 punti 

rungeval = feval(f,xval);% valore della funzione di Runge nei punti xval

m = length(xval);  % lunghezza del vettore xval
yy = zeros(m,4);   % 4 vettori che conterranno i valori dei 4 interpolanti in xval

% CREAZIONE DELL'INTERPOLANTE DI GRADO 6,8,10,15 (4 valori in tutto)
for j=1:4
   n = grado(j) 
   x = chebgausslob(-5,5,n+1); % Calcolo dei nodi di interpolazione
   y = feval(f,x);       % valore delle ordinate nei nodi di interpolazione
   % Creazione dell'interpolante e valutazione in xval
   c = polyfit(x,y,n);
   yy(:,j) = polyval(c,xval); 
%   yy(:,j) = interpol(x,y,xval); %Alternativa alle ultime due istruzioni

   % Calcolo del massimo errore commesso
   err(j) = norm(rungeval-yy(:,j)',inf);
end

 
% Grafici
  figure(1)
   plot(xval,rungeval,'k','linewidth',2);
   hold on
   plot(xval,yy(:,1),'r-');
   plot(xval,yy(:,2),'b-');
   plot(xval,yy(:,3),'g-');
   plot(xval,yy(:,4),'m-');
   legend('1/(1+x^2)','grado 6','grado 8','grado 10','grado 15')
   title('Interpolanti della funzione di Runge (nodi equispaziati)');
   hold off

 figure(2)
   plot(xval,rungeval-yy(:,1)','r-');
   hold on
   plot(xval,rungeval-yy(:,2)','b-');
   plot(xval,rungeval-yy(:,3)','g-');
   plot(xval,rungeval-yy(:,4)','m-');
   legend('err grado 6','err grado 8','err grado 10','grado 15')
   title('Errore di vari interpolanti della funzione di Runge (nodi equispaziati)');
   hold off
