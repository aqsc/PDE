clear;clc;
%-----------------------------------%%-------------------------------------&
%-----------------------------------%%-------------------------------------&
%% written by Ǯ˼��,NO:21401019
%-- introduction to the functions
%-- �˺�������adams�ڲ巨����巨�������u' = -5u, ��u = 0ʱ,u = 1
%-- ���д������������Ի���adams�ڲ巨��adams��巨ͼ������ʵͼ����жԱ�
%% parameters
%-- h----steps
%-- k----k��adams����
%% start
%PLOT_F Summary of this function goes here
%   Detailed explanation goes here
global a b h n
a = 0;b = 1;
h = input('adams k�׷� ����h = :');
n = (b - a)/h; 

k = input('adams k�׷�k = :');
% ԭ���� uy
t = 0:h:1;
uy = exp(-5*t);

plot(t,uy)
hold on
plot(t, k_adamsw(k),'r-o')
hold on 
plot(t,k_adams(k),'g-o')
legend('��ʵͼ��','adams��巨','adams�ڲ巨');
title('adams��巨��adams�ڲ巨����ʵͼ��ıȽ�');

%figure;





