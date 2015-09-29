function [] = LAB2B2()
% Function for LAB2 question B2. 
% Authors: David Weicker and Florentin Goyens
close all;

tol = [1e-3 1e-4 1e-5 1e-6];
numbStep = zeros(1,4);
numbStiff = zeros(1,4);
for i=1:4
    reltol = tol(i);
    options = odeset('RelTol',reltol);%set relative tolerance
    [t,~] = ode23(@robertson,[0 1],[1 0 0]',options);
    [tstiff,~] = ode23s(@robertson,[0 1000],[1 0 0]',options);
    numbStep(i) = length(t)-1;
    numbStiff(i) = length(tstiff)-1;
end
display(numbStep);
display(numbStiff);

h = diff(t);
hstiff = diff(tstiff);

figure; 
plot(t(1:end-1),h);title('Adaptative stepsize with ode23 and reltol = 1e-6');xlabel('Time (sec)'); ylabel('Stepsize (sec)');
figure;
plot(tstiff(1:end-1),hstiff);title('Adaptative stepsize with ode23s and reltol = 1e-6');xlabel('Time (sec)'); ylabel('Stepsize (sec)');
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
