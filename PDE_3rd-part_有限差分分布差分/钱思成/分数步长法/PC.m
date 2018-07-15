function u = PC(t_final,tau,h)
%% @ written by Qian SiCHENG 
%% @ NO:21401019
%% @ �����������������ͷ���
%PC �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
format short 
% t_final = 0.1;    %  0.1/0.2/0.4/0.8
% tau = 0.01;       %  ʱ���Ჽ��
% h = 0.01;         %  x�Ჽ��
r = tau/h^2;      %  ����
M = 1/h;          %  x�������y�����
N = t_final/tau;  %  ʱ�����
x = 0:h:1;
y = 0:h:1;

%******************************************************************
%��ʼ����
a = -r/2*ones(1,M-2);
b = (1+r)*ones(1,M-1);
A = diag(b,0) + diag(a,-1) + diag(a,1);   % �Խ���A

F = zeros(M-1,1);
u = zeros(M+1);
v = zeros(M+1);
w = zeros(M+1);
uu = zeros(M+1);
for n = 1: N 
    % ���� v = u(n+1/4)
    for k = 2:M
        for j = 2:M         
            F(j-1) = f(x(j),y(k),(n+1/2)*tau);
            F(j-1) = u(j,k) + tau/2*F(j-1);            
        end
        v(2:M,k) = A\F;
    end
    % ���� w = u(n+1/2)
    for j = 2:M
        for k = 2:M
            F(k -1) = v(j,k);  
        end
        w(j,2:M) = A\F;
    end
    % ���� uu = u(n+1)
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
