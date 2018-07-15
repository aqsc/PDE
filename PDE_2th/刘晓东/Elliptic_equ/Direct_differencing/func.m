function f = func(t)
%% 二阶常微分方程右端f
% u 为二阶常微分方程的解
% p为（a,b）上一阶连续函数
% r,q,f为(a,b)上连续函数
u = oriu(t);
p = funp(t);
r = funr(t);
q = funq(t);

f = -diff(p * diff(u)) + r * diff(u) + q * u;

end

