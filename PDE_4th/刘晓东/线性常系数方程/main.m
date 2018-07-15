%% main.m 为主函数，运行此文件即得所求图像
% 此程序求解的是线性常系数方程的初边值问题的差分逼近
% 求解方程式为P175第四题
% u_t + u_x = 0  x>0, t>0      u(x,0) = abs(x-1)  u(0,t) = 1
% Upwind_Explicit.m  显式迎风格式
% Upwind_Implicit.m  隐式迎风格式
% Lax_Friedrichs.m   Lax-Friedrichs 格式
% Box_Scheme.m       Box-Scheme 格式
% Lax_Wendroff.m     Lax_Wendroff 格式

close all
clear
clc

% 参数 h为x方向步长，tao为时间轴步长，T为时间
% 利用plotu.m 求解方程并画图
h = 0.5;

for tao = 0.5:0.5:1
    for T = 1:1:5
        figure,
        for i = 1:6
            methodnum = i;
            subplot(2,3,i),
            plotu(tao, h, T, methodnum)
        end
        text(-20,-1, ['h = 1, tao = ' num2str(tao) ' t = ' num2str(T)], 'FontSize', 18)
    end
end