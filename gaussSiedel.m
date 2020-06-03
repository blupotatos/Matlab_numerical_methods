%implementare function gauss-siedel che risolva sitema lineare con GS
%iterattivo. test arresto su norma dello scarto(default norma 2).

function[x, iter, vscarti]=gaussSiedel(A,b,x0,itmax,tol)

[n,m]=size(A);
xold=x0;

%partizione matrice
D=diag(diag(A));
L=tril(A,-1);
U=triu(A,1);

M=L+D;
N=-U;

vscarti=[];
scarto=1;
iter=0;

while scarto>tol && iter<itmax
    iter=iter+1;
    tnoto=N*xold+b;
    x=M\tnoto;
    scarto=norm(x-xold);
    vscarti=[vscarti;scarto];
    xold=x;
end
    