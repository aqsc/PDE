%% @ written by Qian SiCHENG 
%% @ NO:21401019
%% @ 分数步长法解抛物型方程
%% @ ardware:i7  32G DDDR3
% parameters introduction
t_final = 0.1;    %  0.1/0.2/0.4/0.8
tau = 0.01;       %  时间轴步长
h = 0.01;         %  x轴步长
x = 0:h:1;
y = 0:h:1;
%% 画图
%% ADI法解抛物型偏微分方程数值解
u_ADI = ADI(t_final,tau,h);
mesh(x,y,u_ADI)
title('ADI法解抛物型偏微分方程数值解t_final = 0.1,tau=0.01,h =0.01')
xlabel('x-axis')
ylabel('y-axis')
figure
%% P-C法解抛物型偏微分方程数值解
u_PC = PC(t_final,tau,h);
mesh(x,y,u_PC)
title('P-C法解抛物型偏微分方程数值解t_final = 0.1,tau=0.01,h =0.01')
xlabel('x-axis')
ylabel('y-axis')
figure
%% LOD法解抛物型偏微分方程数值解
u_LOD = LOD(t_final,tau,h);
mesh(x,y,u_LOD)
title('LOD法解抛物型偏微分方程数值解t_final = 0.1,tau=0.01,h =0.01')
xlabel('x-axis')
ylabel('y-axis')

