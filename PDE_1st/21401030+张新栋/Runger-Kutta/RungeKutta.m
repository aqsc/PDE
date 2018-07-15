function [t, u]= RungeKutta(mint, maxt, h, u0, myfun)

N = (maxt - mint) / h;
%% handling exceptions
if N ~= floor(N)
    disp('input a appropriate h so that the N is an interger');
    return;
end

%% calculate the value on each node
u = zeros(1, N+1);
t = (0:N).*h + mint;
u(1) = u0;

digits(20);
%% Runge-Kutta iteration
for i = 1:N
%% 三阶
%     k1 = myfun(t(i), u(i));
%     k2 = myfun(t(i)+1/2*h, u(i)+1/2*h*k1);
%     k3 = myfun(t(i)+h, u(i)-h*k1+2*h*k2);
%     u(i+1) = u(i) + h/6*(k1+4*k2+k3);
%% 四四第一个
    k1 = myfun(t(i), u(i));
    k2 = myfun(t(i)+1/3*h, u(i)+1/3*h*k1);
    k3 = myfun(t(i)+2/3*h, u(i)-1/3*h*k1+h*k2);
    k4 = myfun(t(i)+h, u(i)+h*k1-h*k2+h*k3);
    u(i+1) = u(i) + h/8*(k1+3*k2+3*k3+k4);

%% 四四第二个
%     k1 = myfun(t(i), u(i));
%     k2 = myfun(t(i)+1/2*h, u(i)+1/2*h*k1);
%     k3 = myfun(t(i)+1/2*h, u(i)+1/2*h*k2);
%     k4 = myfun(t(i)+h, u(i)+h*k3);
%     u(i+1) = u(i) + h/6 * (k1 + 2*k2 + 2*k3 + k4);
end

%% end of this function
end