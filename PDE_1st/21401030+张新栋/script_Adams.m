close all;
clear all;
clc;

addpath ./utils
addpath ./Euler
addpath ./Adams

mint = 0;maxt = 1;
step1 = 0.05;
step2 = 0.05;
f0 = 1;
%% this is improved Euler method
[X1, F1] = Adams(mint, maxt, step1, f0, @Func, 'in');
%% this is Euler method
[X2, F2] = Adams(mint, maxt, step1, f0, @Func, 'out');

plot(X1, F1, 'r*', X1, F1);
hold on
plot(X2, F2, 'bo', X2, F2);
title('comparing Euler methods with different step')
legend('adams out', 'adams in')