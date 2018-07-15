%% this is the script of the Euler method
%% du/dt = f(u,t), st f(0) = 1 and 0<=x<=1
clear all;
close all;
clc;
addpath ./utils
addpath ./Euler
addpath ./Adams

mint = 0;maxt = 1;
step1 = 0.05;
step2 = 0.05;
f0 = 1;
%% this is improved Euler method
[X1, F1] = ImproveEuler(mint, maxt, step1, f0, @Func);
%% this is Euler method
[X2, F2] = Euler(mint, maxt, step2, f0, @Func);
X3 = X2;
F3 = GroundTruth(X3);
plot(X1, F1, '*', X1, F1);
hold on
plot(X2, F2, 'o', X2, F2);
hold on 
plot(X3, F3, 'g+', X3, F3);
title('comparing Euler methods with different step')

legend('Euler','Improved Euler','Ground Truth')