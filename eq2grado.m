%formula risolutiva dell'eq di 2 grado
a=1; b= -3; c=2;
delta=b^2-4*a*c;
if delta < 0 
    disp('Radici complesse')
else
    x1=(-b-sqrt(delta))/(2*a)
    x2=(-b +sqrt(delta))/(2*a)
end    
