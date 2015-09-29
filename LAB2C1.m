function [] = LAB2C1()
% Function for LAB2 question C1. 
% Authors: David Weicker and Florentin Goyens
close all;

% Resolution of the ode
[~,x1] = ode45(@flow,[0 10],[-4 0.2]');
[~,x2] = ode45(@flow,[0 10],[-4 0.6]');
[~,x3] = ode45(@flow,[0 10],[-4 1]');
[~,x4] = ode45(@flow,[0 10],[-4 1.6]');

% Plot of the trajectories and the cylinder
plot(x1(:,1),x1(:,2),x2(:,1),x2(:,2),x3(:,1),x3(:,2),x4(:,1),x4(:,2),2*sin(0:0.1:2*pi),2*cos(0:0.1:2*pi),'k--');axis equal;
title('Flow of four particles');
legend('y(0)=0.2','y(0)=0.6','y(0)=1.0','y(0)=1.6');
xlabel('Direction x');
ylabel('Direction y');

end

function dxdt = flow(t,x)
R = 2;
dxdt = x;
square = (x(1)*x(1)+x(2)*x(2))*(x(1)*x(1)+x(2)*x(2));
dxdt(1) = 1 - R*R*(x(1)*x(1)-x(2)*x(2))/square;
dxdt(2) = -2*R*R*x(1)*x(2)/square;
end

