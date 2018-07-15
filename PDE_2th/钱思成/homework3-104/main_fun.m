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
%% ---------------------SOR����----------------------------------
[u_sor,u,Num_SOR] = SOR(h);
error_SOR = u - u_sor;
mesh(x,y,u)                  %%  ��ʵͼ����Ϣu_r
title('��ʵͼ����Ϣ')
figure;
mesh(x,y,u_sor)                %%  SOR����ͼ����Ϣu_sor
title('SOR����ͼ����Ϣ')
figure;
mesh(x,y,error_SOR)            %%  SOR����ͼ������ʵͼ������
title('SOR����ͼ������ʵͼ������')
disp('SOR����������')
disp(Num_SOR)                  %%  SOR������������
% %% -------------------------PR��------------------------
 figure
[u_pr,Num_PR] = PR(h);
error_PR = u - u_pr;   
mesh(x,y,u_pr)                 %%  PRͼ����Ϣ
title('PR����ͼ��')
figure;       
mesh(x,y,error_PR)             %%  PR����ͼ������ʵͼ�����
title('PR����ͼ������ʵͼ������')
disp('PR����������') 
disp(Num_PR)                   %%  PR������������
figure;
%% -------------------------CONGUGATE����------------------------
[u_con,Num_CON] = congugate(h);
mesh(x,y,u_con)
title('CONGUGATE����ͼ��')
figure;
error_CON = u - u_con; 
mesh(x,y,error_CON)
title('CONGUGATE����ͼ������ʵͼ������')
disp('CONGUGATE����������') 
disp(Num_CON) 
figure
%% -------------------------pre_CONGUGATE����---------------------
[u_pre,Num_PRE] = pre_congugate(h);
mesh(x,y,u_pre)
title('pre_CONGUGATE����ͼ��')
figure;
error_PRE = u - u_pre; 
mesh(x,y,error_PRE)
title('pre_CONGUGATE����ͼ������ʵͼ������')
disp('pre_CONGUGATE����������') 
disp(Num_PRE) 
t = toc;