%script che crea matrici hilbert di ordine n per n=3,...,15 e ne calcoli 
%il numero di condizionamento

for n=3:15
    H=hilb(n);
    fprintf('[N] %7d   [cond] %12.3E \n', n, cond(H));
end