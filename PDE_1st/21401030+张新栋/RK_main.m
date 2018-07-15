close all;
clear all;
clc;

addpath ./utils
addpath ./Runger-Kutta


mint = 0;maxt = 2;
step1 = 0.1;
step2 = 0.5;
step3 = 1;
f0 = 1;
%% runge-kutta with different step
[X1, F1] = RungeKutta(mint, maxt, step1, f0, @FuncRK);
[X2, F2] = RungeKutta(mint, maxt, step2, f0, @FuncRK);
[X3, F3] = RungeKutta(mint, maxt, step3, f0, @FuncRK);
X4 = 0:0.1:2;
F4 = GroundTruthRK(X4);
plot(X1, F1, 'r*', X1, F1,'r');
hold on
plot(X2, F2, 'bo', X2, F2,'b');
hold on
plot(X3, F3, 'ko', X3, F3,'k');
hold on 
plot(X4, F4, 'ko', X4, F4,'k');
hold on
title('Runge-Kutta')
legend('step 0.1','step 0.5','step 1','ground truth')