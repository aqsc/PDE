function [ u ] = explicit_scheme( a, t, h, tao, temp )
%% 差分方程显格式主体
% 计算相关参数
J = 1 / h;
N = t / tao;
r = a * tao / h;

% 初始化所求解u
u = zeros(J+1, 1);

% 系数矩阵MatA
MatA = coefficient_matA(2*(1-r^2), r^2, r^2, J);

% 初始条件 u0 u1, 抛去两端点，计算中间N-1个点
x = h:h:1-h;
u0 = fi0(x');

% temp为计算初始条件u1的方法
% normal_diff为一般的差分方程，central_diff为中心差商
switch temp
    case 'normal_diff'
        u1 = u0 + tao * fi1(x');
    case 'central_diff'
        u1 = 0.5 * MatA * u0 + tao * fi1(x');
end

% 利用初始条件求解
for n = 3:N+1
    u2 = MatA * u1 - u0;
    u0 = u1;
    u1 = u2;
end
u(2:J) = u2;

end

