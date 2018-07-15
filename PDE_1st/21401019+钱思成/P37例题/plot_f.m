% main.m ---- plot_f---用四阶Runge-Kutta解决偏微分方程

% problem： u' = 4tu^(1/2)
% 用四阶Runge-Kutta解决偏微分方程和原函数精确图像进行对比
% written by 钱思成, NO:21401019
%PLOT_F Summary of this function goes here
%   Detailed explanation goes here
clear;clc;
global t n 
format long
digits(10)
h = input('h = :');    % 设定步长
a = 0;
b = 2;
%h = 0.1;
t = a:h:b;
n = (b - a)/h;
u = runge(h);

plot(t,u,'r-*')    %  四阶Runge-Kutta解决偏微分方程图像
hold on 
uz = (1+t.^2).^2;    %  精确解
plot(t,uz,'g-o')
legend('四阶runge-Kutta法图像','精确图像');
title('四阶runge-Kutta法解决偏微分方程');
figure;
%为了精确看出图像对应值，下面将图像分开显示
str = [repmat(', u:',n+1,1) num2str(u')];
plot(t,u,'g-o')
text(t,u,cellstr(str))
title('四阶runge-Kutta法解决偏微分方程');
figure;

str1 = [repmat(', uz:',n+1,1) num2str(uz')];
plot(t,uz,'g-o')
text(t,uz,cellstr(str1))
title('偏微分方程精确图像');

figure;
error = uz - u;
plot(t,error)
title('四阶runge-Kutta法解偏微分方程error分析')



