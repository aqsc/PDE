function  U_Richardson = Richardson(N,J)
%RICHARDSON 此处显示有关此函数的摘要
%   此处显示详细说明
global tao h x r a
tic;
% tao = T/N;  % t轴步长tao
% t = 0:tao:T;
% h = L/J;    % x轴步长h
% x = 0:h:L;
% r = a*tao/(h^2);
%% 
P = -2*ones(J-1,1);
Q = ones(J-2,1);
A = diag(Q,1)+diag(Q,-1)+diag(P,0);   %生成系数矩阵A为(J-1)维的矩阵
% compute 初始值 边值条件
ux0 = zeros(1,J+1);
for j = 1:J+1
    ux0(j) = sin(pi*x(j));
end
B = zeros(J-1,N+1);
B(:,1) = ux0(:,2:J);

%% compute B(:,2)      用显格式求解      将tao分成10份
seg = 400;
tao_1 = tao/seg;
% tt = 0:tao_1:tao;

r1 = a*tao_1/(h^2);
P1 = (1-2*r1)*ones(J-1,1);
Q1 = r1*ones(J-2,1);
A1 = diag(Q1,1)+diag(Q1,-1)+diag(P1,0);   %生成系数矩阵A为(J-1)维的矩阵

C = zeros(J-1,seg+1);
C(:,1) = ux0(:,2:J);
for k = 1:seg
    C(:,k+1) = A1*C(:,k);
end

B(:,2) = C(:,seg+1);
%% 知道当t = 0和t =1时的值，用Richardson方法进行迭代求解
for k = 2:N
    a = B(:,k-1);
    B(:,k+1) = 2*r*A*B(:,k) + B(:,k-1);
end
U_Richardson = zeros(J+1,N+1);
U_Richardson(2:J,1:N+1) = B;
%% 时间
t_Richardson = toc;
disp('operation time of Richardson:')
disp(t_Richardson)

end

