%% main.m为此函数的主程序
%  此函数解决的是P231页用线性元求解初值问题
%  函数为   -y'' + pi^2 /4 * y = pi^2 /2 *sin(pi/2 * x),
%            0<x<1, y(0) = 0,y'(1) = 0
%  精确解为y = sin(pi/2 * x);
%  此函数将x等分成n份.
%  stiffness_Ritz.m 为刚度矩阵的Ritz算法

close all
clear
clc

x = 0:0.1:1;
y = stiffness_Ritz( pi^2 / 4 );
exacty = sin(pi/2 * x);                  % 精确解
figure,
plot(x, y,'r*-', x, exacty, 'g+-')
legend('stiffness-Ritz', 'exact')