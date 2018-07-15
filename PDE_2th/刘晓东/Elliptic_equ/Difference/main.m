%% main.m ��������
% �ò�ַ��������׳�΢�ַ��̱�ֵ����
% -u'' + xu = (x-1)*e^x    u(0)=1  u(1) = e
% ���д��ļ�����������Ҫ�Ĳ���h
% ����������(a,b)Ϊ������alfa��beitaΪ�߽�ֵ
e = exp(1);
a = 0;
b = 1;
alfa = 1;
beita = e;

% ��(a,b)�ȷ�ΪN�ݣ�hΪ����
% N= input('�����뽫�������ֵķ���N��');
N = 50;
h = (b - a) / N;
u0 = alfa;
uN = beita;

% ���ò�ַ��̼����v, uΪ�ڵ��ϵĽ�
u = differencefun(N, h, u0, uN);

v = zeros(N+1,1); 
v(1) = u0;
v(N+1) = uN;
for i = 2:N
    v(i) = u(i-1);
end

% ��ͼ
t = 0:h:1;
plot(t,v,'r*-')
title('the solution of difference equation')
