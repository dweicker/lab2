function [n_approx] = LAB2A()
 % Function for LAB2 question A. 
% Authors: David Weicker and Florentin Goyens
close all;

N = [320 160 80 40 20 10];
value = zeros(1,length(N));
init = [1 0]'; %initial conditions

% Solve equation
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

% Plot error to estimate the order of the method
error = abs(value-value(1));% for h
loglog(1./N,error,'b-',1./N,error,'r.','MarkerSize',15); 
title('Evolution of error with step size');
xlabel('Step size h');
ylabel('Estimated error at t=1');

n_approx = log(error(2)/error(end))/log(N(end)/N(2)); %returns an approximation of the order
end

function dudt = vanderpol(t,u)
%System of ODE's for Van Der Pol's equation
epsilon = 1;
dudt = u;
dudt(1) = u(2);
dudt(2) = -u(1) - epsilon*(u(1)*u(1)-1)*u(2);
end
