function u = PC(t_final,tau,h)
%% @ written by Qian SiCHENG 
%% @ NO:21401019
%% @ 分数步长法解抛物型方程
%PC 此处显示有关此函数的摘要
%   此处显示详细说明
format short 
% t_final = 0.1;    %  0.1/0.2/0.4/0.8
% tau = 0.01;       %  时间轴步长
% h = 0.01;         %  x轴步长
r = tau/h^2;      %  网比
M = 1/h;          %  x轴份数，y轴份数
N = t_final/tau;  %  时间份数
x = 0:h:1;
y = 0:h:1;

%******************************************************************
%初始条件
a = -r/2*ones(1,M-2);
b = (1+r)*ones(1,M-1);
A = diag(b,0) + diag(a,-1) + diag(a,1);   % 对角阵A

F = zeros(M-1,1);
u = zeros(M+1);
v = zeros(M+1);
w = zeros(M+1);
uu = zeros(M+1);
for n = 1: N 
    % 计算 v = u(n+1/4)
    for k = 2:M
        for j = 2:M         
            F(j-1) = f(x(j),y(k),(n+1/2)*tau);
            F(j-1) = u(j,k) + tau/2*F(j-1);            
        end
        v(2:M,k) = A\F;
    end
    % 计算 w = u(n+1/2)
    for j = 2:M
        for k = 2:M
            F(k -1) = v(j,k);  
        end
        w(j,2:M) = A\F;
    end
    % 计算 uu = u(n+1)
    for j = 2:M
        for k = 2:M
            F(k-1) = f(x(j),y(k),(n+1/2)*tau);
            uu(j,k) = r*(w(j+1,k) - 2*w(j,k) + w(j-1,k) + w(j,k+1) - 2*w(j,k) + w(j,k-1)) + u(j,k) + tau*F(k-1);
        end
    end
    u = uu;
end 
u = u';
% mesh(x,y,u)
