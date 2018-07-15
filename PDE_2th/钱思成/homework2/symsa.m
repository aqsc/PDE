
%SYMSA 此处显示有关此函数的摘要
%   此处显示详细说明
clear;clc;
syms x;
p = x^2+1;
r = x;
q = x^2;
u = 1/4 - (x-1/2)^2;
f = -diff(p*diff(u)) + r*diff(u) + q*u;
f = simple(f)



