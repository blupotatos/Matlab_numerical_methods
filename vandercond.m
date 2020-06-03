%matrice vandermonde di ordine n corrispondente a n punti equispaziati in
%intervallo [1,2]. grafico numero cond.in funzione ordine matrice

cnd=[];  %vettore numeri condizionamento

for n=3:10
    x=1:1/(n-1):2; %vettore punti equispaziati
    V=vander(x); %matrice vandermonde ordine n
    cnd=[cnd, cond(V)];
end

%grafico semilogaritmico cond. in funzione dimensione matrice
semilogy(3:10, cnd, 'm-+');
title('num.condizionamento Vs dimensione');
xlabel('dimensione');
ylabel('n.cond.');
