%esercizio fattorizzazione LU 1

A=[4 -2 -1 0; -2 4 1 0.5; -1 1 4 1; 0 0.5 1 4];

%calcolare i minori principali e vedere se verificate ipotesi teorema LDU
m1=A(1,1);
m2=A(1:2,1:2);
m3=A(1:3,1:3);
m4=A(1:4,1:4);   %minori principali

dm1=det(m1)
dm2=det(m2)
dm3=det(m3)
dm4=det(m4)    %determinanti minori principali

[L,U]=lu(A)

%risolvere scegliendo b t.c. Ax=b con x=(1,1,1,1)T
x=ones(4,1);
b=A*x;
xsol=A\b;
fprintf('\n\n soluzione:\n');
disp(xsol);

%ora risolvo con LU: Ly=b e y=Ux
y=L\b;
xsoluzLU=U\y;
fprintf('\n\n soluzione LU:\n');
disp(xsoluzLU);



