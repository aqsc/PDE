%% main.m 是主程序
% 用差分方程求解二阶常微分方程边值问题
% -u'' + xu = (x-1)*e^x    u(0)=1  u(1) = e
% 运行此文件后输入所需要的步长h
% 给定参数，(a,b)为定义域，alfa，beita为边界值
e = exp(1);
a = 0;
b = 1;
alfa = 1;
beita = e;

% 将(a,b)等分为N份，h为步长
% N= input('请输入将区间所分的份数N：');
N = 50;
h = (b - a) / N;
u0 = alfa;
uN = beita;

% 利用差分方程计算解v, u为内点上的解
u = differencefun(N, h, u0, uN);

v = zeros(N+1,1); 
v(1) = u0;
v(N+1) = uN;
for i = 2:N
    v(i) = u(i-1);
end

% 画图
t = 0:h:1;
plot(t,v,'r*-')
title('the solution of difference equation')
