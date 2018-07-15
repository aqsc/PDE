clear all;close all;clc;
%% main_function
%% written by qiansicheng, NO:21401019
%% SOR & PR & CONGUGATE & PRE_CONGUGATE
global x y M N 
format long
tic
a = 0;
b = 1;
h = 1/64;
h1 = h;
h2 = h;
M = (b -a)/h1;
N = (b-a)/h2;
x = a:h:b;
y = a:h:b;
%% ---------------------SOR方法----------------------------------
[u_sor,u,Num_SOR] = SOR(h);
error_SOR = u - u_sor;
mesh(x,y,u)                  %%  真实图像信息u_r
title('真实图像信息')
figure;
mesh(x,y,u_sor)                %%  SOR方法图像信息u_sor
title('SOR方法图像信息')
figure;
mesh(x,y,error_SOR)            %%  SOR方法图像与真实图像的误差
title('SOR方法图像与真实图像的误差')
disp('SOR迭代次数：')
disp(Num_SOR)                  %%  SOR方法迭代次数
% %% -------------------------PR法------------------------
 figure
[u_pr,Num_PR] = PR(h);
error_PR = u - u_pr;   
mesh(x,y,u_pr)                 %%  PR图像信息
title('PR方法图像')
figure;       
mesh(x,y,error_PR)             %%  PR方法图像与真实图像误差
title('PR方法图像与真实图像的误差')
disp('PR迭代次数：') 
disp(Num_PR)                   %%  PR方法迭代次数
figure;
%% -------------------------CONGUGATE方法------------------------
[u_con,Num_CON] = congugate(h);
mesh(x,y,u_con)
title('CONGUGATE方法图像')
figure;
error_CON = u - u_con; 
mesh(x,y,error_CON)
title('CONGUGATE方法图像与真实图像的误差')
disp('CONGUGATE迭代次数：') 
disp(Num_CON) 
figure
%% -------------------------pre_CONGUGATE方法---------------------
[u_pre,Num_PRE] = pre_congugate(h);
mesh(x,y,u_pre)
title('pre_CONGUGATE方法图像')
figure;
error_PRE = u - u_pre; 
mesh(x,y,error_PRE)
title('pre_CONGUGATE方法图像与真实图像的误差')
disp('pre_CONGUGATE迭代次数：') 
disp(Num_PRE) 
t = toc;