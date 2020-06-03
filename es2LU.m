%definita la matrice A e il termine noto b risolva Ax=b(soluzione vera 
% x =[1 1 1]T. Richiamare la funzione lugauss e risolvere i 2 sistemi
% triangolari con il comando \

A=[2 1 0; 1 2 1; 0 1 2];
b=[3; 4; 3];

[L, U]= lugauss(A);
y=L\b;
x=U\y;

fprintf('soluzione:\n');
disp(x);
