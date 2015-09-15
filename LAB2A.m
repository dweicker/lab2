function [] = LAB2A()
%LAB2A 
N = [10 20 40 80 160 320];

end

function dudt = vanderpol(t,u)
%System of ODE's for Van Der Pol's equation
epsilon = 1;
dudt = u;
dudt(1) = u(2);
dudt(2) = -u(1) - epsilon*(u(1)*u(1)-1)*u(2);
end
