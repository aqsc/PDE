% function [ output_args ] = plot_f( input_args )
%PLOT_F Summary of this function goes here
%   Detailed explanation goes here
%% 将区间0:1不均匀的分配
clear;clc;
a = 0; b =1;
len = b -a;
N = 100;
% N = input('请输入区间等分数 N =：（默认值100）');

h = ranf(len,N);      % 生成非均匀的区间划分
%h = 0.01*ones(N,1);
x = zeros(1,N+1);     % 区间上的N+1个点
x(1) = 0;
for i = 2:N+1
    x(i) = h(i-1) + x(i-1);
end
     

%% 构造系数矩阵A
A = zeros(N-1);
for i =2:N-2
%     h(i) = x(i+1) - x(i);
    x_0 = x(i) + h(i)/2;
%     h(i+1) = x(i+2) - x(i+1);
    x_1 = x(i+1) + h(i+1)/2;
    A(i,i) = 2/(h(i)+h(i+1))*(p(x_1)/h(i+1) + p(x_0)/h(i)) + q(x(i+1)); 
    A(i,i+1) = -2/(h(i)+h(i+1))*(p(x_1)/h(i+1)) + r(x(i+1))/(h(i) + h(i+1));
    A(i,i-1) = -2/(h(i)+h(i+1))*(p(x_0)/h(i)) - r(x(i+1))/(h(i) + h(i+1));
end
x_0 = x(1) + h(1)/2;
x_1 = x(2) + h(2)/2;
A(1,1) = 2/(h(1)+h(2))*(p(x_1)/h(2) + p(x_0)/h(1)) + q(x(2)); 
A(1,2) = -2/(h(1)+h(2))*(p(x_1)/h(2)) + r(x(2))/(h(1) + h(2));

x_0 = x(N-1) + h(N-1)/2;
x_1 = x(N) + h(N)/2;
A(N-1,N-1) = 2/(h(N-1)+h(N))*(p(x_1)/h(N) + p(x_0)/h(N-1)) + q(x(N));
A(N-1,N-2) = -2/(h(N-1)+h(N))*(p(x_0)/h(N-1)) + r(x(N))/(h(N-1) + h(N));

F = zeros(N-1,1);
% F(1) = -[-2/(h(1)+h(2))*p(x(1) + h(1)/2)/h(1) + r(x(2))/(h(1)+h(2))]*u(1) + f(x(1));
F(1) = f(x(2));
% F(N-1) = -[-2/(h(N-1)+h(N))*p(x(N-1)+h(N-1))/h(N) + r(N+1)/(h(N-1)+h(N))]*u(N+1) + f(x(N-1));
F(N-1) = f(x(N));
for i =2:N-2
    F(i) = f(x(i+1)); 
end
%% 构成了三对角矩阵，下面解方程组  将求解变量记为u
u = zeros(1,N+1);   % 初始化
u(1) = 0;
u(N+1) = 0;
U = trian(A,F);     % 利用追赶法求解三对角阵为系数的线性方程组
for i =2:N
    u(i) = U(i-1);
end
plot(x,u,'b-')
hold on

u_z = 1/4 -(x-1/2).^2;
plot(x,u_z,'r-')

figure;
error = u_z - u;
plot(x,error,'y-');
title('差分方程解的函数图像')
    





