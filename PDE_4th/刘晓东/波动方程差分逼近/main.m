%% main.m是利用差分方程显格式求解波动方程
% 主方法在explicit_scheme.m中，译为显格式差分方程
% coefficient_matA.m 计算系数矩阵
%
close all
clear
clc

% 相关参数赋值
a = 1;
h = 0.1;

% 求解作图
for tao = 0.05:0.05:0.1
    i = 1;
    figure,
    for t = 0.5:0.5:2
        subplot(2,2,i),
        plotu(t, a, h, tao, 2)
        i=i+1;
    end
end