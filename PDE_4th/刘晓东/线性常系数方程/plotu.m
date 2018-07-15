function plotu(  tao, h, T, methodnum)
%% plotu函数利用输入的参数及求解方法，求解方程并作图
% 参数a 为方程中u_x的系数，max_X为任意取定的x的范围
% methodnum 为选择的方法，color为线条颜色

a = 1;
max_X = 10;

switch methodnum
    case 1
        method = 'Upwind Explicit';
        color = 'r-';
        u = Upwind_Explicit(a, h, tao, T, max_X);
    case 2
        method = 'Upwind Implicit';
        color = 'g-';
        u = Upwind_Implicit(a, h, tao, T, max_X);
    case 3
        method = 'Lax-Friedrichs';
        color = 'b-';
        u = Lax_Friedrichs(a, h, tao, T, max_X);
    case 4
        method = 'Box-Scheme';
        color = 'm-';
        u = Box_Scheme(a, h, tao, T, max_X);
    case 5
        method = 'Lax-Wendroff';
        color = 'c-';
        u = Lax_Wendroff(a, h, tao, T, max_X);
    case 6
        method = 'Exact Solution';
        color = 'k-';
        u = Exact_u(h, T, max_X);
end

x = 0:h:max_X;
plot(x, u, color)
xlabel('x'), ylabel('u')
title(method)
end

