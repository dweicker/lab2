function [] = LAB2A()
%LAB2A 
close all;

N = [10 20 40 80 160 320];
value = zeros(1,length(N));
init = [1 0]'; %initial conditions
for j = 1:length(N)
    n = N(j);
    u = [init zeros(2,n)];
    h = 1/n;
    for i=1:n
        k1 = vanderpol(i*h,u(:,i));
        k2 = vanderpol((i+1)*h,u(:,i)+h*k1);
        k3 = vanderpol((i+0.5)*h,u(:,i)+h*k1./4+h*k2./4);
        u(:,i+1) = u(:,i)+h*(k1+k2+4*k3)./6;
    end
    value(j) = u(1,end);
end
error = abs(value-value(end));
loglog(N,error,'b-',N,error,'r.','MarkerSize',15);
end

function dudt = vanderpol(t,u)
%System of ODE's for Van Der Pol's equation
epsilon = 1;
dudt = u;
dudt(1) = u(2);
dudt(2) = -u(1) - epsilon*(u(1)*u(1)-1)*u(2);
end
