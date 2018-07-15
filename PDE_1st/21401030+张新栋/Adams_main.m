close all;
clear all;
clc;

addpath ./utils
addpath ./Euler
addpath ./Adams


mint = 0;maxt = 1;
step1 = 0.05;
step2 = 0.1;
f0 = 1;
%% this is improved Euler method
[X1, F1] = Adams(mint, maxt, step1, f0, @Func, 'in');
%% this is Euler method
[X2, F2] = Adams(mint, maxt, step1, f0, @Func, 'out');

X3 = X2;
F3 = GroundTruth(X3);

%% this is improved Euler method
[X4, F4] = ImproveEuler(mint, maxt, step1, f0, @Func);
%% this is Euler method
[X5, F5] = Euler(mint, maxt, step1, f0, @Func);

plot(X1, F1, 'r*', X1, F1);
hold on
plot(X2, F2, 'bo', X2, F2);
hold on 
plot(X3, F3, 'g+', X3, F3);
title('comparing Euler methods with different step')
legend('interier adams','outerier adams','ground truth')


figure
plot(abs(F2-F3),'r')
hold on
plot(abs(F1-F3),'b')
hold on
plot(abs(F4-F3),'c')
hold on
plot(abs(F5-F3),'m')
legend('outerier adams', 'interier adams','Improved Euler','Euler')