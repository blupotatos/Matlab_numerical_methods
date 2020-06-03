s(1)=exp(-1);
f=@(x) exp(x).*x;
Ivero(1)=quad(f,0,1,1e-14)*exp(-1);
for n=1:50
    s(n+1) = 1 - (n+1)*s(n);
    f=@(x) exp(x).*x^(n+1);
    Ivero(n+1)=quad(f,0,1,1e-14)*exp(-1);
end
errins=(s-Ivero)./Ivero;
