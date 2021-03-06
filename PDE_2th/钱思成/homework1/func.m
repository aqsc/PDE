function [A,x] = func( input_args )
%FUNC 此处显示有关此函数的摘要
%   此处显示详细说明
clear;clc;
a = 0; b =1;
N = 100;
h = (b-a)/N;
u = zeros(1,N+1);
u(1) = 1;
u(N+1) = exp(1);
x = a:h:b;
q = zeros(1,N-1);
f = zeros(1,N-1);
for i = 1:N-1
    f(i) = f_x(x(i));
    q(i) = q_x(x(i));
end
%% 构造A matrix
A = zeros(N-1);
for i = 1:N-2
    A(i,i+1) = -1/(h^2);
    A(i+1,i) = -1/(h^2);
    A(i,i) = 2/(h^2)+q_x(x(i+1));
end
A(N-1,N-1) = 2/(h^2) +q_x(x(N));
%% 构造F -Vector
F = zeros(N-1,1);
F(1) = u(1)/(h^2) + f_x(x(2));
F(N-1) = u(N+1)/(h^2) + f_x(x(N));
for i =2:N-2
    F(i) = f_x(x(i+1)); 
end
%% 构成了三对角矩阵，下面解方程组

