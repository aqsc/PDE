%% main.m�����ò�ַ����Ը�ʽ��Ⲩ������
% ��������explicit_scheme.m�У���Ϊ�Ը�ʽ��ַ���
% coefficient_matA.m ����ϵ������
%
close all
clear
clc

% ��ز�����ֵ
a = 1;
h = 0.1;

% �����ͼ
for tao = 0.05:0.05:0.1
    i = 1;
    figure,
    for t = 0.5:0.5:2
        subplot(2,2,i),
        plotu(t, a, h, tao, 2)
        i=i+1;
    end
end