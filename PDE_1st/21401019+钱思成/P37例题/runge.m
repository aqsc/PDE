function u = runge(h)
%RUNGE Summary of this function goes here
%   Detailed explanation goes here

global t n 
u = zeros(1,n+1);
u(1) = 1;
for i = 1:n
    k1 = fun(t(i),u(i));
    k2 = fun(t(i)+(1/2)*h,u(i)+(1/2)*h*k1);
    k3 = fun(t(i)+(1/2)*h,u(i)+(1/2)*h*k2);
    k4 = fun(t(i)+h,u(i)+h*k3);
    u(i+1) = u(i) + h/6*(k1 + 2*k2 + 2*k3 + k4);
    
end

