% ----------------------------&-----------------------------------------%%
% ----------------------------&-----------------------------------------%%
close all;clear;clc;
global tao t h x r a
format long;
N = 1000;  %t轴分的份数
J = 8;  %x轴分的份数
T = 0.1;
L = 1;
a = 1;

tao = T/N;  % t轴步长tao
t = 0:tao:T;
h = L/J;    % x轴步长h
x = 0:h:L;
r = a*tao/(h^2);
%%
[U0,U_forth] = forth(N,J);
mesh(t,x,U_forth)
title('forthward differential image')
figure
mesh(t,x,U0)
title('true image')
figure
error_forth = U_forth - U0;
mesh(t,x,error_forth)
title('error image of forthward method')
figure
%%
U_back = back(N,J);
mesh(t,x,U_back)
title('backward differential image')
figure
error_back = U_back - U0;
mesh(t,x,error_back)
title('error image of backward method')
figure
%%
U_crank = Crank(N,J);
mesh(t,x,U_crank)
title('Crank-Nicolson differential image')
figure
error_forth = U_crank - U0;
mesh(t,x,error_forth)
title('error image of Crank-Nicolson method')
figure
%%
U_Richardson = Richardson(N,J);
mesh(t,x,U_Richardson)
title('Richardson differential image')
figure
error_Richardson = U_Richardson - U0;
mesh(t,x,error_Richardson)
title('error image of Richardson method')

save('.\dat','U0','U_forth','U_back','U_crank','U_Richardson')

