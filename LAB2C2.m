function [] = LAB2C2()
% Function for LAB2 question C2. 
% Authors: David Weicker and Florentin Goyens
close all;
a = [pi/6 pi/4 pi/3];
k = [0.02 0.065];
options = odeset('NonNegative',3); % ensures that y stays non negative
result = cell(3,2);

for j=1:2
    for i=1:3
    init = [0 20*cos(a(i)) 1.5 20*sin(a(i))]';
    [~,y] = ode45(@(t,x) throw(t,x,k(j)),[0 3],init,options);% quid du @(tx,) ?
    result{i,1} = y(:,1);
    result{i,2} = y(:,3);
    end
    subplot(2,1,j);
    plot(result{1,1},result{1,2},result{2,1},result{2,2},result{3,1},result{3,2});
    string = sprintf('Motion for k = %f',k(j));
    title(string);
    legend('alpha = 30','alpha = 45','alpha = 60');
    xlabel('Distance (m)');
    ylabel('Height (m)');
end
end

function dxdt = throw(t,x,k)
square = sqrt(x(2)*x(2)+x(4)*x(4));
dxdt = x;
dxdt(1) = x(2);
dxdt(2) = -k*x(2)*square;
dxdt(3) = x(4);
dxdt(4) = -9.81-k*abs(x(4))*square;
end

