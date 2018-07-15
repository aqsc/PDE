function [u_pr,Num_PR]= PR(h)
%SOR Summary of this function goes here
%   Detailed explanation goes here
% ����������

format long
global x y N
tic
tao = 1/2*h^2*(sin(pi*h))^(-1);
%% -----------------�������L1��L2-------------------------------%%
l1 = zeros(N-1);
for i = 1:N-2
    l1(i,i) = 2/h^2;
    l1(i,i+1) = -1/h^2;
    l1(i+1,i) = -1/h^2;
end
l1(N-1,N-1) = 2/h^2;

L1 = kron(eye(N-1),l1); 
L2 = kron(l1,eye(N-1));
%% -----------------��������F------------------------------------%%
F = zeros((N-1)*(N-1),1);
for j = 2:N 
    for i = 2:N   
        F((j-2)*(N-1)+i-1) = f(x(i),y(j));
    end
end
%%  -----------------�����������--------------------------------%%
Num_PR = 0;
u = zeros((N-1)*(N-1),1);             %��¼���ֵ
k = 0;
while k >=0
    k = 0;
    Num_PR =  Num_PR + 1;
    u0 = u;
    u = (eye((N-1)*(N-1)) + tao*L1)\((eye((N-1)*(N-1))-tao*L2)*u + tao*F);
    u = (eye((N-1)*(N-1)) + tao*L2)\((eye((N-1)*(N-1))-tao*L1)*u + tao*F);
    for i = 1:(N-1)*(N-1)
        if abs(u0 - u) > 10^(-4)
            k = k + 1;                   %% �ж�ÿһ���������,k��ֵ��¼�������ĸ���
        end      
    end
    if k ==0
        break;
    end      
end 
%%  ������PR�����õ���u_pr
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




