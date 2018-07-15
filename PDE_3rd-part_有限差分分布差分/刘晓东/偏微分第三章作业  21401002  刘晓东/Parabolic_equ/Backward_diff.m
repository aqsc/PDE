function [ u ] = Backward_diff( J, N, h, tao, r )
%% 向后差分格式

% 初始化 u, v1, f
u = zeros(J+1, N+1);
v1 = zeros(J-1,1);
f = zeros(J-1,1);

% 向后差分格式的系数矩阵A
A = coefficient_matA(1+2*r, -r, -r, J);

% 计算v1,f
for j = 1:J-1
    v1(j) = fi(j*h);
    f(j) = funf(j*h);
end

% 计算得到矩阵 u 为向后差分格式求得的解
u(2:J,1) = v1;
for n = 2:N+1
    v1 = A \ ( v1 + tao * f);
    u(2:J,n) = v1;
end

end