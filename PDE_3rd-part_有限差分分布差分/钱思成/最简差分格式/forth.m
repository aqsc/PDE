function [U0,U_forth] = forth(N,J)
%FORTH 此处显示有关此函数的摘要
%   此处显示详细说明
tic;
global  t x r
% tao = T/N;  % t轴步长tao
% t = 0:tao:T;
% h = L/J;    % x轴步长h
% x = 0:h:L;
% r = a*tao/(h^2);

P = (1-2*r)*ones(J-1,1);
Q = r*ones(J-2,1);
A = diag(Q,1)+diag(Q,-1)+diag(P,0);   %生成系数矩阵A为(J-1)维的矩阵
% compute 初始值
ux0 = zeros(1,J+1);
for j = 1:J+1
    ux0(j) = sin(pi*x(j));
end
B = zeros(J-1,N);
B(:,1) = ux0(:,2:J);
for k = 1:N
    B(:,k+1) = A*B(:,k);
end
U_forth = zeros(J+1,N+1);
U_forth(2:J,1:N+1) = B;
%% 时间求解
t_forth = toc;
disp('operation time of forthward:')
disp(t_forth)
%% 原始真实图像求解
tic;
for n = 1:N+1
    for  j = 1:J+1  
        U0(j,n) = exp(-pi^2*t(n))*sin(pi*x(j));
    end
end
t_true = toc;
disp('operation time of true:')
disp(t_true)




end