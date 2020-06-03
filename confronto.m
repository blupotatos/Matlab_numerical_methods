% SCRIPT OF COMPARISON BETWEEN KNOTS
% CHEBYSHEV-GAUSS AND DI
% CHEBYSHEV-GAUSS-LOBATTO
m=15;   % number of Gauss-Chebyshev nodes
a=-1; b =1;   % Interval
% Gauss-Chebyshev knots
xgc=chebgauss(a,b,m);
plot(xgc,zeros(m,1),'r*');hold on;
% Gauss-Chebyshev knots
xgcl=chebgausslob(a,b,m);
plot(xgcl,zeros(m,1),'b*');
legend('Nodi GC','Nodi GCL'); hold off

