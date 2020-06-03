x = [1998.9 1999 1999.1 1999.2 1999.3 1999.42]
y = [2 2 4 5 6 7];
coef = polyfit(x,y,5);
xx = linspace(x(1),x(end));
plot(x,y,'r+',xx,polyval(coef,xx),'b-','LineWidth',2)

hold on

for i = 1:100
ys(i) = lagrange(x,y,xx(i));
end 

plot(xx,ys,'g-','LineWidth',2)

