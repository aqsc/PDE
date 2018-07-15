function [ u ] = ADI( h, N, M, tao, r, fi )
%% ADI 法（交替方向隐格式）
%  h, tao为步长,f 为常数项系数
% 求解思路： M为x方向,y方向分割份数，u为(M+1)*(M+1)矩阵
%           N为时间轴的分割，在时间轴上迭代并更新矩阵u
%           第n个时间点迭代为：（系数矩阵A左乘表示对u中列做变化，又乘对行做变化）
%           第一步：n -> n+1/2  分在等式两边，左端矩阵A1,右端矩阵A2
%                  A1 * u1 = u0 * A2 + tao / 2 * f
%           第二步：n+1/2 -> n+1  分在等式两边，左端矩阵A1,右端矩阵A2
%                  u2 * A1 = A2 * u1 + tao /2 * f
u = zeros(M+1, M+1);
A1 = coefficient_matA(1+r, -r/2, -r/2, M);
A2 = coefficient_matA(1-r, r/2, r/2, M);
u0 = fi;

for n = 1:N
    f = funf(h, M, (n-1)*tao);
    u1 = A1 \ (u0 * A2) + A1 \ (tao / 2 * f);
    u2 = (A2 * u1) / A1 + (tao / 2 * f) / A1;
    u0 = u2;
end

u(2:M, 2:M) = u2;

end