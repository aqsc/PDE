%% main.m为主程序
% 用直接差分法求解编制问题
% -（p*u'）' + r*u' + q*u = f   u(0) = 0  u(1) = 0
% u(x) = 1/4 - (x-1/2)^2     p(x) = x^2+1   q(x) = x^2  r(x) = x
% 运行此程序，先输入所需分成的份数N
%（a,b）为定义域，alfa,beita为边界取值
a = 0;
b = 1;
alfa = 0;
beita = 0;

% 将区间(a,b)分为N份，u0,uN为边界值
% N = input('请输入将区间所分的份数N：');
N = 50;
u0 = alfa;
uN = beita;

% 利用一阶差分格式计算求解，x为不定步长的节点，u1为节点上解的取值
[x,u1] = DifferenceEqu(N , a , b, u0, uN);

% 原始解
t = 0:0.001:1;
u2 = oriu(t);

% 误差项
v = abs(oriu(x) - u1);

% 画图
figure
plot(x,u1,'r-', t, u2, 'b-')
title('The Solution')
legend('直接差分化','原始解')

figure
plot(x, v, 'r*-')
title('The Error')
