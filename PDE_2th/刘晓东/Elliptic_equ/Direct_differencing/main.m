%% main.mΪ������
% ��ֱ�Ӳ�ַ�����������
% -��p*u'��' + r*u' + q*u = f   u(0) = 0  u(1) = 0
% u(x) = 1/4 - (x-1/2)^2     p(x) = x^2+1   q(x) = x^2  r(x) = x
% ���д˳�������������ֳɵķ���N
%��a,b��Ϊ������alfa,beitaΪ�߽�ȡֵ
a = 0;
b = 1;
alfa = 0;
beita = 0;

% ������(a,b)��ΪN�ݣ�u0,uNΪ�߽�ֵ
% N = input('�����뽫�������ֵķ���N��');
N = 50;
u0 = alfa;
uN = beita;

% ����һ�ײ�ָ�ʽ������⣬xΪ���������Ľڵ㣬u1Ϊ�ڵ��Ͻ��ȡֵ
[x,u1] = DifferenceEqu(N , a , b, u0, uN);

% ԭʼ��
t = 0:0.001:1;
u2 = oriu(t);

% �����
v = abs(oriu(x) - u1);

% ��ͼ
figure
plot(x,u1,'r-', t, u2, 'b-')
title('The Solution')
legend('ֱ�Ӳ�ֻ�','ԭʼ��')

figure
plot(x, v, 'r*-')
title('The Error')
