function [ u ] = PC( h, N, M, tao, r, fi )
%% PC 法（预 - 校法）
%  h, tao为步长,f 为常数项系数
% 求解思路： M为x方向,y方向分割份数，u为(M+1)*(M+1)矩阵
%           N为时间轴的分割，在时间轴上迭代并更新矩阵u
%           第n个时间点迭代为：（系数矩阵A左乘表示对u中列做变化，又乘对行做变化）
%           第一步：n -> n+1/4  分在等式两边，左端矩阵A1,右端矩阵A2
%                  u1 * A1  = A2 * u0 + tao / 2 * f
%           第二步：n+1/4 -> n+1/2  分在等式两边，左端矩阵A1,右端矩阵A2
%                  A1 * u2 = u1
%           第三步：n & n+1/2 -> n+1 分在等式两边，
%                  u3 = u0 + u2 * A3 + A3 * u2 + tao * f
% u0 ->n, u1 -> n+1/4, u2 -> n+1/2, u3 -> n+1
u = zeros(M+1, M+1);
A1 = coefficient_matA(1+r, -r/2, -r/2, M);
A3 = coefficient_matA(-2 * r, r, r, M);
u0 = fi;

for n = 1 : N
    f = funf(h, M, (n-1)*tao);
    u1 = u0 / A1 + tao / 2 * f / A1;
    u2 = A1 \ u1;
    u3 = u0 + u2 * A3 + A3 * u2 + tao * f;
    u0 = u3;
end

u(2:M, 2:M) = u3;
end