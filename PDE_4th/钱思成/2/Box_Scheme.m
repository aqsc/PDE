function u = Box_Scheme(a,tau,h)
%BOX 此处显示有关此函数的摘要
%   此处显示详细说明
global x T x_final
r = a*tau/h;
N = T/tau;
M = x_final/h;
u = zeros(1,M+1);
% 计算初始的u
for j = 1:M+1
    u(j) = abs(x(j)-1);
end
% 下面进行迭代
u0 = zeros(1,M+1);
for i = 1:N
    u0(1) = 1;
    for j = 2:M+1
        u0(j) = ((1+a*r)^(-1))*((1-a*r)*u(j) + (1+a*r)*u(j-1) - (1-a*r)*u0(j-1));
    end   
    u = u0;
end

end

