function xc = chebgauss(a,b,n)
% calculates nodes of Gauss-Chebyshev (scaled: translated to [a, b])
% USE: xc = chebgauss (a, b, n)
% the vector xc contains nodes sorted in ascending order
for k = 1:n
    xc(k) = (a+b)/2 - ((b-a)/2)*cos((2*k-1)/(2*n)*pi);
end


