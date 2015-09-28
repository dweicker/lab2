function [] = LAB2B1()
%LAB2B 
close all;

N = [125 250 500 1000 2000];
init = [1 0 0]'; %initial conditions
for j = 1:length(N)
    n = N(j);
    u = [init zeros(3,n)];
    h = 1/n;
    for i=1:n %Runge-Kutta
        k1 = robertson(i*h,u(:,i));
        k2 = robertson((i+1)*h,u(:,i)+h*k1);
        k3 = robertson((i+0.5)*h,u(:,i)+h*k1./4+h*k2./4);
        u(:,i+1) = u(:,i)+h*(k1+k2+4*k3)./6;
    end
    str = sprintf('The last value for n = %d is x = %f,%f,%f',n,u(1,n),u(2,n),u(3,n)); %stable or not?
    display(str);
end
figure;
loglog(0:h:1,u);title('Robertson''s problem (N=2000)');xlabel('Time (sec)');ylabel('Quantities (kg)');legend('x1','x2','x3');
end


function dxdt = robertson(t,x)
k1 = 0.04;
k2 = 1e4;
k3 = 3e7;
dxdt = x;
dxdt(1) = -k1*x(1) + k2*x(2)*x(3);
dxdt(2) = k1*x(1) -k2*x(2)*x(3) -k3*x(2)*x(2);
dxdt(3) = k3*x(2)*x(2);
end

