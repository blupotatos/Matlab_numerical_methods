%---------------------------------------------------------------------------%
% ESEMPIO DEGLI EFFETTI DEL MALCONDIZIONAMENTO SULLA SOLUZIONE DI UN SISTEMA.
%---------------------------------------------------------------------------%
% SCRIPT PER LA RISOLUZIONE DI UN SISTEMA LINEARE CON LA MATRICE DI HILBERT
%---------------------------------------------------------------------------%

n = 12;  % dimensione della matrice (quadrata)
H = hilb(n); %creazione della matrice di Hilbert di ordine 12
kappa = cond(H); %calcolo del numero di condizionamento di H
fprintf('\n \t [COND K_2(H)]        %3.3e ',kappa);

xvera = ones(n,1); 
b = H* xvera; %creazione del termine noto del sistema
              %in modo che la soluzione sia un vettore con tutti 1 

x = H\b;      %Risoluzione del sistema lineare

%Calcolo della norma dell'errore relativo
err_rel = norm(x-xvera)/norm(xvera); 
fprintf('\n \t [ERRORE RELATIVO]    %3.3e',err_rel);

%Calcolo della norma del residuo relativo
res_rel = norm(b-H*x)/norm(b);
fprintf('\n \t [RESIDUO RELATIVO]   %3.3e',res_rel);
fprintf('\n ');