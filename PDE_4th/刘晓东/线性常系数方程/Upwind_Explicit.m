function u = Upwind_Explicit( a, h, tao, T, max_X )
%% 显式迎风格式

N = T / tao;
M = max_X / h;
r = a * tao / h;
u = zeros(M+1, 1);
u0 = zeros(M+1, 1);

matA = coefficient_matA(r, 1-r, 0, M, 1);

for i = 1:M+1
    u0(i) = funf((i-1) * h);
end

for j = 2:N+1
    u(2:M+1,1) = matA * u0;
    u(1) = u0(1);
    u0 = u;
end

end

