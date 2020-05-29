function [x,iter, scarti]= aitken(g,x0,tol,itmax)
% -------------------------------------------------------------------------
% Aitken method
% [xvec,iter, scarti, asint1] =pfisso(g,x0,epsilon,itmax)
% -------- OUTPUT VARIABLES -----------
% scarti: array with differences (scarti(i) = xk+1 -xk)
% x: array with the calculated approximations of the fixed point
% iter: number of iterations executed
% asint1: array that approximates the factor of convergence M using the 
%          ratio between two consecutive scarti.
% -------- INPUT VARIABLES ------------
% g: function (i.e.@(x)2*x^2-x)
% x0: initial point
% tol: requested tolleranvce on scarto
% itmax: number of max iterations allowed
%--------------------------------------------------------------------------
% i.e if you run with [x,iter,scart]=aitken(@(x)3*x^2-x, 1, 0.001,100)
% finds the value that makes 3x^2-x = x; the estimates x value for each 
% iteration is stored in array x
% iter: number of iteration used to reach the approximate value of x
% scarti: reppresents  xk+1 -xk
% -------------------------------------------------------------------------

xa=x0;
x=[x0];
iter=0;
dif=tol+1;
scarti=[];
while abs(dif)>tol & iter<itmax
     iter=iter+1;
     xb=feval(g,xa);
     xc=feval(g,xb);
     dif=-((xb-xa).^2)./(xc-2*xb+xa);
     xa=xa+dif;
     x=[x;xa];
     scarti=[scarti;dif];
end


if iter==itmax 
    disp('Raggiunto il massimo numero di iterazioni');
end
