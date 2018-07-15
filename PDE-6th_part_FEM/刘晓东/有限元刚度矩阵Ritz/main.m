%% main.mΪ�˺�����������
%  �˺����������P231ҳ������Ԫ����ֵ����
%  ����Ϊ   -y'' + pi^2 /4 * y = pi^2 /2 *sin(pi/2 * x),
%            0<x<1, y(0) = 0,y'(1) = 0
%  ��ȷ��Ϊy = sin(pi/2 * x);
%  �˺�����x�ȷֳ�n��.
%  stiffness_Ritz.m Ϊ�նȾ����Ritz�㷨

close all
clear
clc

x = 0:0.1:1;
y = stiffness_Ritz( pi^2 / 4 );
exacty = sin(pi/2 * x);                  % ��ȷ��
figure,
plot(x, y,'r*-', x, exacty, 'g+-')
legend('stiffness-Ritz', 'exact')