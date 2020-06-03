function xc=chebgausslob(a,b,n)
% calculates Gauss-Chebyshev-Lobatto nodes (scaled: translated to [a, b])
% USE: xc = chebgausslob (a, b, n)
for k=1:n
    xc(k)=(a+b)/2-((b-a)/2)*cos(pi*(k-1)/(n-1));
end
