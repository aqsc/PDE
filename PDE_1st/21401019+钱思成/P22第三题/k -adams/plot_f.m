clear;clc;
%-----------------------------------%%-------------------------------------&
%-----------------------------------%%-------------------------------------&
%% written by 钱思成,NO:21401019
%-- introduction to the functions
%-- 此函数利用adams内插法和外插法进行求解u' = -5u, 当u = 0时,u = 1
%-- 运行此主函数，可以画出adams内插法和adams外插法图像与真实图像进行对比
%% parameters
%-- h----steps
%-- k----k阶adams方法
%% start
%PLOT_F Summary of this function goes here
%   Detailed explanation goes here
global a b h n
a = 0;b = 1;
h = input('adams k阶法 步长h = :');
n = (b - a)/h; 

k = input('adams k阶法k = :');
% 原函数 uy
t = 0:h:1;
uy = exp(-5*t);

plot(t,uy)
hold on
plot(t, k_adamsw(k),'r-o')
hold on 
plot(t,k_adams(k),'g-o')
legend('真实图像','adams外插法','adams内插法');
title('adams外插法和adams内插法与真实图像的比较');

%figure;





