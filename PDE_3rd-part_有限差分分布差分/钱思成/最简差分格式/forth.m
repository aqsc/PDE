function [U0,U_forth] = forth(N,J)
%FORTH �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
tic;
global  t x r
% tao = T/N;  % t�Ჽ��tao
% t = 0:tao:T;
% h = L/J;    % x�Ჽ��h
% x = 0:h:L;
% r = a*tao/(h^2);

P = (1-2*r)*ones(J-1,1);
Q = r*ones(J-2,1);
A = diag(Q,1)+diag(Q,-1)+diag(P,0);   %����ϵ������AΪ(J-1)ά�ľ���
% compute ��ʼֵ
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
%% ʱ�����
t_forth = toc;
disp('operation time of forthward:')
disp(t_forth)
%% ԭʼ��ʵͼ�����
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