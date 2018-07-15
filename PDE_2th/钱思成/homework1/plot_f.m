% ---Summary of this function goes here
% ---Detailed explanation goes here
clear;clc;
a = 0; b =1;
N = input('����������ȷ��� N =����Ĭ��ֵ100��');
h = (b-a)/N;
u = zeros(1,N+1);
u(1) = 1;
u(N+1) = exp(1);
x = a:h:b;
q = zeros(1,N-1);
f = zeros(1,N-1);
for i = 1:N-1
    f(i) = f_x(x(i+1));
    q(i) = q_x(x(i+1));
end
%% ����A matrix
A = zeros(N-1);
for i = 1:N-2
    A(i,i+1) = -1/(h^2);
    A(i+1,i) = -1/(h^2);
    A(i,i) = 2/(h^2)+q(i);
end
A(N-1,N-1) = 2/(h^2) +q(N-1);  % A(N-1��N-1)  
%% ����F -Vector
F = zeros(N-1,1);
F(1) = u(1)/(h^2) + f(1);
F(N-1) = u(N+1)/(h^2) + f(N-1);
for i =2:N-2
    F(i) = f(i+1); 
end
%% ���������ԽǾ�������ⷽ���� 
U = trian(A,F);     % ����׷�Ϸ�������Խ���Ϊϵ�������Է�����
% U = gauss(A,F);
% U = Gauss_Seidel(A,F);
for i =2:N
    u(i) = U(i-1);
end
plot(x,u)
title('��ַ��̽�ĺ���ͼ��');
    


