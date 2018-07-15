%% 此程序求解的是带有初边值问题的一维热传导方程
% 四种方法 
% 1. 向前差分格式 Forward_diff.m
% 2. 向后差分格式 Backward_diff.m
% 3. 六点对称格式 Crank_Nicolson.m
% 4. Richardson格式 Richardson.m
% surfu.m为计算求解，并作图
close all
clear
clc

% 初始化参数a（热传导方程系数）,l（x的上界）,
% T（t的上界）,J（等分x定义域的份数）,N（等分t定义域的份数）
a = 1;
l = 1;
T = 0.1;
J = 20;
N = 10;

% 求解并作图
surfu(a, l, T, J, N, 'Forward difference')
surfu(a, l, T, J, N, 'Backward difference')
surfu(a, l, T, J, N, 'Crank Nicolson')
surfu(a, l, T, J, N, 'Richardson')