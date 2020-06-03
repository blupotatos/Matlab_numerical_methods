n = 100;
A = 4*diag(ones(n,1))-diag(ones(n-1,1),-1)-diag(ones(n-1,1),1);
A(1,:) = ones(1,n);
A(:,1) = ones(n,1);

figure; 
spy(A); title('A');

[L,U,P] = lu(A);

figure; 
spy(U); title('U');

figure; 
spy(L); title('L');