%% �˳��������Ǵ��г���ֵ�����һά�ȴ�������
% ���ַ��� 
% 1. ��ǰ��ָ�ʽ Forward_diff.m
% 2. ����ָ�ʽ Backward_diff.m
% 3. ����ԳƸ�ʽ Crank_Nicolson.m
% 4. Richardson��ʽ Richardson.m
% surfu.mΪ������⣬����ͼ
close all
clear
clc

% ��ʼ������a���ȴ�������ϵ����,l��x���Ͻ磩,
% T��t���Ͻ磩,J���ȷ�x������ķ�����,N���ȷ�t������ķ�����
a = 1;
l = 1;
T = 0.1;
J = 20;
N = 10;

% ��Ⲣ��ͼ
surfu(a, l, T, J, N, 'Forward difference')
surfu(a, l, T, J, N, 'Backward difference')
surfu(a, l, T, J, N, 'Crank Nicolson')
surfu(a, l, T, J, N, 'Richardson')