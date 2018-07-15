function [u_pr,Num_PR]= PR(h)
%SOR Summary of this function goes here
%   Detailed explanation goes here
% 单参数情形

format long
global x y N
tic
tao = 1/2*h^2*(sin(pi*h))^(-1);
%% -----------------计算矩阵L1和L2-------------------------------%%
l1 = zeros(N-1);
for i = 1:N-2
    l1(i,i) = 2/h^2;
    l1(i,i+1) = -1/h^2;
    l1(i+1,i) = -1/h^2;
end
l1(N-1,N-1) = 2/h^2;

L1 = kron(eye(N-1),l1); 
L2 = kron(l1,eye(N-1));
%% -----------------计算向量F------------------------------------%%
F = zeros((N-1)*(N-1),1);
for j = 2:N 
    for i = 2:N   
        F((j-2)*(N-1)+i-1) = f(x(i),y(j));
    end
end
%%  -----------------计算迭代次数--------------------------------%%
Num_PR = 0;
u = zeros((N-1)*(N-1),1);             %记录求解值
k = 0;
while k >=0
    k = 0;
    Num_PR =  Num_PR + 1;
    u0 = u;
    u = (eye((N-1)*(N-1)) + tao*L1)\((eye((N-1)*(N-1))-tao*L2)*u + tao*F);
    u = (eye((N-1)*(N-1)) + tao*L2)\((eye((N-1)*(N-1))-tao*L1)*u + tao*F);
    for i = 1:(N-1)*(N-1)
        if abs(u0 - u) > 10^(-4)
            k = k + 1;                   %% 判断每一项收敛情况,k的值记录不收敛的个数
        end      
    end
    if k ==0
        break;
    end      
end 
%%  计算由PR方法得到的u_pr
u_pr = zeros(N+1,N+1);
for j = 1:N-1
    for i = 1:N-1  
        u_pr(i+1,j+1) = u((N-1)*(j-1)+i);        
    end
end  
t_PR = toc
disp('operation time:');
disp(t_PR);
end




