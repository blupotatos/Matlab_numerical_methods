%-------------------------------------------------------------------------
% SCRIPT to model the population growth in the United States. 
% From data taken from 1900 to 2000, the population predicted in 2010 
% is estimated, and then compared to the real value of 308.745.538 abitants
% registered in 2010.
%-------------------------------------------------------------------------
% years in which misuration are taken 
x= 1900:10:2000;

%%t= 1900:10:2000;
%%x=(t-1950)./50;

% data in milions abitants
y=[75.995 91.972  105.711  123.203 131.669 150.697 179.323 203.212 226.505 249.633 281.422];
yvero= 308.745; % milioni di abitanti
xestrap=2010;
%%xestrap=(2010-1950)/50;

%points of evaluation of least squares approximation 
xx = linspace(x(1),xestrap);  

% Least squares polynomial approximation grade 1(straight line)
a1 = polyfit(x,y,1);
yy1 = polyval(a1,xx);

% Error with above 1st grade polynomial
err1vec = (polyval(a1,x)-y).^2;
err1 = sum(err1vec)

prevrettaMQ=polyval(a1,xestrap)

% Least squares polynomial approximation grade 2
a2 = polyfit(x,y,2);
yy2 = polyval(a2,xx);

%error using grade 2 polynomial 
err2vec = (polyval(a2,x)-y).^2;
err2 = sum(err2vec)

prevparab=polyval(a2,xestrap)

%spline interpolation
sp=spline(x,y);
yinterpsp=ppval(sp,xx);
previnterpsp=ppval(sp,xestrap)

% PLOTS
plot(x,y,'mo','markersize',6); hold on;
plot(xx,yy1,'b-','Linewidth',2); % Least squares polynomial approximation grade 1
plot(xx,yy2,'r-','Linewidth',2); % Least squares polynomial approximation grade 2
plot(xx,yinterpsp,'c-','Linewidth',2); % spline interpolation
plot(xestrap,yvero,'g*','markersize',10); % real population in 2010
legend('points','grade 1','grade 2','interp. spline',...
'real value','Location','northwest'); hold off;











