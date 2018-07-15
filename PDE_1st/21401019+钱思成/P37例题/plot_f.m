% main.m ---- plot_f---���Ľ�Runge-Kutta���ƫ΢�ַ���

% problem�� u' = 4tu^(1/2)
% ���Ľ�Runge-Kutta���ƫ΢�ַ��̺�ԭ������ȷͼ����жԱ�
% written by Ǯ˼��, NO:21401019
%PLOT_F Summary of this function goes here
%   Detailed explanation goes here
clear;clc;
global t n 
format long
digits(10)
h = input('h = :');    % �趨����
a = 0;
b = 2;
%h = 0.1;
t = a:h:b;
n = (b - a)/h;
u = runge(h);

plot(t,u,'r-*')    %  �Ľ�Runge-Kutta���ƫ΢�ַ���ͼ��
hold on 
uz = (1+t.^2).^2;    %  ��ȷ��
plot(t,uz,'g-o')
legend('�Ľ�runge-Kutta��ͼ��','��ȷͼ��');
title('�Ľ�runge-Kutta�����ƫ΢�ַ���');
figure;
%Ϊ�˾�ȷ����ͼ���Ӧֵ�����潫ͼ��ֿ���ʾ
str = [repmat(', u:',n+1,1) num2str(u')];
plot(t,u,'g-o')
text(t,u,cellstr(str))
title('�Ľ�runge-Kutta�����ƫ΢�ַ���');
figure;

str1 = [repmat(', uz:',n+1,1) num2str(uz')];
plot(t,uz,'g-o')
text(t,uz,cellstr(str1))
title('ƫ΢�ַ��̾�ȷͼ��');

figure;
error = uz - u;
plot(t,error)
title('�Ľ�runge-Kutta����ƫ΢�ַ���error����')



