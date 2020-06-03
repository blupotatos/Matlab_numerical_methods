function [P,R] = wilk(n)

P = poly(1:n);
R = roots(P);
figure(1)
plot(1:n,0,'k+', real(R),imag(R),'r*')
figure(2)
err = abs(R-(n:-1:1)')./(n:-1:1)';
semilogy(1:n,err,'bo')

