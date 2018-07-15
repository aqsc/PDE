%% @ written by Qian SiCHENG 
%% @ NO:21401019
%% @ �����������������ͷ���
%% @ ardware:i7  32G DDDR3
% parameters introduction
t_final = 0.1;    %  0.1/0.2/0.4/0.8
tau = 0.01;       %  ʱ���Ჽ��
h = 0.01;         %  x�Ჽ��
x = 0:h:1;
y = 0:h:1;
%% ��ͼ
%% ADI����������ƫ΢�ַ�����ֵ��
u_ADI = ADI(t_final,tau,h);
mesh(x,y,u_ADI)
title('ADI����������ƫ΢�ַ�����ֵ��t_final = 0.1,tau=0.01,h =0.01')
xlabel('x-axis')
ylabel('y-axis')
figure
%% P-C����������ƫ΢�ַ�����ֵ��
u_PC = PC(t_final,tau,h);
mesh(x,y,u_PC)
title('P-C����������ƫ΢�ַ�����ֵ��t_final = 0.1,tau=0.01,h =0.01')
xlabel('x-axis')
ylabel('y-axis')
figure
%% LOD����������ƫ΢�ַ�����ֵ��
u_LOD = LOD(t_final,tau,h);
mesh(x,y,u_LOD)
title('LOD����������ƫ΢�ַ�����ֵ��t_final = 0.1,tau=0.01,h =0.01')
xlabel('x-axis')
ylabel('y-axis')

