%% main.m���÷�������������ά�ȴ������̵ı�ֵ����
% ��ĿΪ���ֱ���ADI,PC,LOD�����P141��ϰ��

close all
clear
clc

% ����
h = [0.05,0.1];
t = [0.1, 0.2, 0.4, 0.8];
% ��ͼ
for i = 1:2
    for j = 1:4
        figure,
        subplot(2,2,1),surfu( h(i), t(j), 'ADI' )
        subplot(2,2,2),surfu( h(i), t(j), 'PC' )
        subplot(2,2,3),surfu( h(i), t(j), 'LOD')
        texts = text(2,0.5,['h = ' num2str(h(i)) ' t = ' num2str(t(j))], 'FontSize', 18);
    end
end