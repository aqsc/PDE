function surfu( h, t, method )
%% 带入参数求解二维热传导方程

% 由步长计算份数
tao = 0.01;
N = t / tao;
M = 1 / h;
v = 1;

% 网比 v为热传导方程右端系数,fi 为初值
r = v * tao / h^2;
fi = zeros(M-1,M-1);

% 网格化定义域
x = 0:h:1;
y = 0:h:1;
[yy,xx] = meshgrid(y,x);

% 选择方法求解方程得解 u
switch method
    case 'ADI'
        u = ADI( h, N, M, tao, r, fi );
    case 'PC'
        u = PC( h, N, M, tao, r, fi );
    case 'LOD'
        u = LOD( h, N, M, tao, r, fi );
end

% 作图
surf(xx, yy, u);
xlabel('x')
ylabel('y')
zlabel('u')
title( [method ' method'])


end