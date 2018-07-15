function u = Upwind_Implicit( a, h, tao, T, max_X )
%% 隐式迎风格式
% M,N 为x方向，t方向份数

N = T / tao;
M = max_X / h;
r = a * tao / h;
u0 = zeros(M+1, 1);
u = zeros(M+1, 1);

for i = 1:M+1
    u0(i) = funf((i-1) * h);
end

for i = 1:N
    u(1) = 1;
    for j = 2:M+1
        u(j) = 1/(1+r) * u0(j) + r/(1+r) * u(j-1);
    end
    u0 = u;
end

