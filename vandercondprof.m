vcond=zeros(10,1);
for n=3:10
    x=1:1/(n-1):2;
    A=vander(x)
    c=cond(A)
    vcond(n)=c;
pause;
end
semilogy(3:10,vcond(3:10),'r-');
title('Grafico semilogaritmico del condizionamento della matrice di Vandermonde');
xlabel('n');
ylabel('Numero di condizionamento');
