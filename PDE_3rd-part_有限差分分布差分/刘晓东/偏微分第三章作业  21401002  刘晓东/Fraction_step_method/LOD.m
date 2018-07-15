function [ u ] = LOD( h, N, M, tao, r, fi )
%% LOD 格式 双循环局部一维格式
% 初始化u,u0, 计算系数矩阵A1,A2
% h, tao为步长,f 为常数项系数
% 求解思路： M为x方向,y方向分割份数，u为(M+1)*(M+1)矩阵
%           N为时间轴的分割，在时间轴上迭代并更新矩阵u
%           第n个时间点迭代为：（系数矩阵A左乘表示对u中列做变化，又乘对行做变化）
%           第一步：n-1 -> n-1/2  分在等式两边，左端矩阵A1,右端矩阵A2
%                   u1 * A1 = u0 * A2 + tao / 2 * f1
%           第二步：n-1/2 -> n  分在等式两边，左端矩阵A1,右端矩阵A2
%                  A1 * u2  = A2 * u1 + tao /2 * f1
%           第三步：n -> n+1/2 分在等式两边
%                  A1 * u3 = A2 * u2 + tao / 2 * f1
%           第四步：n+1/2 -> n+1 分在等式两边
%                  u4 * A1 = u3 * A2 + tao /2 * f2
u = zeros(M+1, M+1);
A1 = coefficient_matA(1+r, -r/2, -r/2, M);
A2 = coefficient_matA(1-r, r/2, r/2, M);
u0 = fi;

for n = 1:N/2
    f1 = funf(h, M, 2*(n-1)*tao);
    f2 = funf(h, M, (2*n-1)*tao);
    u1 = (u0 * A2) / A1 + (tao / 2 * f1) / A1;
    u2 = A1 \ (A2 * u1) + A1 \ (tao / 2 * f1);
    u3 = A1 \ (A2 * u2) + A1 \ (tao / 2 * f1);
    u4 = (u3 * A2) / A1 + (tao / 2 * f2) / A1;
    u0 = u4;
end

u(2:M, 2:M) = u4;
end