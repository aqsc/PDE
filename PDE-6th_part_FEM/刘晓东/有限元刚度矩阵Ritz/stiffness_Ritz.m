function u = stiffness_Ritz(q)
%% stiffness_RitzΪ��������ֵ����ĸնȾ����Ritz�㷨��
%  xi Ϊ��������б任�õ���һ������
%  K = sum(Ki) KiΪ��Ԫ�նȾ���KΪ�ܸնȾ���
%  M = sum(Mi) 
%  steph Ϊ����

%  ��ʼ����ز���
%  xiΪ��������
syms xi;    
n = 10;
K = zeros(n+1,n+1);
M = zeros(n+1,n+1);
b = zeros(n+1,1);

%  �̶�����Ϊ0.1,ѡȡ��0,1����Ľڵ�
steph = 0.1 * ones(n,1);
x = 0:0.1:1;

%  Ki,MiΪͨ��������ĵĵ�Ԫ�նȾ���
%  K,M Ϊ�е�Ԫ�նȾ����γɵ��ܸնȾ���
for i = 1:n
    Ki = [1/steph(i),-1/steph(i);-1/steph(i),1/steph(i)];
    Mi = [1/3,1/6;1/6,1/3] .* steph(i) .* q;
    funf = func( x(i)+steph(i) * xi);
    bi = [int(funf *(1-xi),xi,0,1); int(funf * xi, xi, 0, 1)] .* steph(i);
    K(i:i+1,i:i+1) = K(i:i+1,i:i+1) + Ki;
    M(i:i+1,i:i+1) = M(i:i+1,i:i+1) + Mi;
    b(i:i+1,1) = b(i:i+1,1) + bi;
end
A = K+M;

%  �ɹ�ʽ[A11,A12;A21,A22] * U - b = 0��� newA ��ΪA22,
%  newA * U~ - newb = 0
newA = A(2:n+1,2:n+1);
newb = b(2:n+1);
u = newA\newb;
%  ��������ֵu0
u = [0,u(1:n)'];
end