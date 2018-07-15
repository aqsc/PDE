clear;clc;
%MAIN_FUN 此处显示有关此函数的摘要
%   此处显示详细说明
t_final = 1.0;   % 0.5 1.5 2.0
tau = 0.05;      % t  轴步长
h = 0.1;         % x  轴步长
N = t_final/tau; % t  轴份数  
X = 1/h;         % x  轴份数
t = 0:tau:t_final;
x = 0:h:1;
u_true = u_true(x,t_final);
% t = linspace(0,t_final,N);
% x = linspace(0,1,H);
% u = u_true(x,t);
plot(x,u_true,'-*b')
hold on 
u_explicit = explicit(tau,h,t_final);
plot(x,u_explicit,'-or')


