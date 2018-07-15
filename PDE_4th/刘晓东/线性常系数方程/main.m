%% main.m Ϊ�����������д��ļ���������ͼ��
% �˳������������Գ�ϵ�����̵ĳ���ֵ����Ĳ�ֱƽ�
% ��ⷽ��ʽΪP175������
% u_t + u_x = 0  x>0, t>0      u(x,0) = abs(x-1)  u(0,t) = 1
% Upwind_Explicit.m  ��ʽӭ���ʽ
% Upwind_Implicit.m  ��ʽӭ���ʽ
% Lax_Friedrichs.m   Lax-Friedrichs ��ʽ
% Box_Scheme.m       Box-Scheme ��ʽ
% Lax_Wendroff.m     Lax_Wendroff ��ʽ

close all
clear
clc

% ���� hΪx���򲽳���taoΪʱ���Ჽ����TΪʱ��
% ����plotu.m ��ⷽ�̲���ͼ
h = 0.5;

for tao = 0.5:0.5:1
    for T = 1:1:5
        figure,
        for i = 1:6
            methodnum = i;
            subplot(2,3,i),
            plotu(tao, h, T, methodnum)
        end
        text(-20,-1, ['h = 1, tao = ' num2str(tao) ' t = ' num2str(T)], 'FontSize', 18)
    end
end