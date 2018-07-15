function U_back = back(N,J)
%back �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
global  x r
tic;
% tao = T/N;  % t�Ჽ��tao
% t = 0:tao:T;
% h = L/J;    % x�Ჽ��h
% x = 0:h:L;
% r = a*tao/(h^2);

P = (1+2*r)*ones(J-1,1);
Q = -r*ones(J-2,1);
A = diag(Q,1)+diag(Q,-1)+diag(P,0);   %����ϵ������AΪ(J-1)ά�ľ���
% compute ��ʼֵ
ux0 = zeros(1,J+1);
for j = 1:J+1
    ux0(j) = sin(pi*x(j));
end
B = zeros(J-1,N+1);
B(:,1) = ux0(:,2:J);
for k = 1:N
    B(:,k+1) = A\B(:,k);
end
U_back = zeros(J+1,N+1);
U_back(2:J,1:N+1) = B;
%% ʱ��
t_back = toc;
disp('operation time of backward:')
disp(t_back)
end


