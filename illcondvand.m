% SCRIPT DI VERIFICA DEGLI EFFETTI DEL MALCONDIZONAMENTO DELLA MATRICE
% DI VANDERMONDE SUL CALCOLO DEL POLINOMIO DI INTERPOLAZIONE

% 6 nodi di interpolazione
xx = [1200.5 1201.5 1202.5 1203 1204 1205];
y = [3 1.5 1.5 1 1 0];

% grado del polinomio di interpolazione
n = length(xx)-1;

% Calcolo del pol. di interpolazione tramite polyfit
xval = linspace(xx(1),xx(end));
coef = polyfit(xx,y,n);
yval = polyval(coef,xval);

% Calcolo del pol. di interpolazione con Lagrange 
for i=1:length(xval); 
    yy(i) = lagrange(xx,y,xval(i));
end

% Calcolo del pol. di interpolazione risolvendo il sistema 
% con la matrice di Vandermonde 
A = vander(xx);
coefvan = A\y';
yvalvan = polyval(coefvan,xval);

plot (xval,yval,'b-')
hold on
plot (xx,y,'k+','Linewidth',3)
plot(xval,yy,'r-')
plot(xval,yvalvan,'g-')
legend('grado 5 con polyfit','punti','grado 5 con Lagrange','grado 5 con Vandermonde')

disp('Condizionamento matrice di Vandermonde');
cond(A)
hold off