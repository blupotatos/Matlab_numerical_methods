function [L,U]= lugauss(A)
% lugauss: calcola la fattorizazzione LU 
% di A senza pivoting
% USO: [L,U]= lugauss(A)

n=size(A,1); %return the number of row(1)
L=eye(n);     %matrice identità

for k=1:n-1  % numero di passi dell'alg. di El. di Gauss
  L(k+1:n,k)=A(k+1:n,k)/A(k,k);  % tutti i moltiplicatori al passo k
  for i=k+1:n                    % aggiornamento della sottomatrice attiva
      for j=k:n 
          A(i,j)=A(i,j)-L(i,k)*A(k,j) ; 
    end
  end
end
U=triu(A);  %potevo mettere semplicemente A