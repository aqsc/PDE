clear;clc;
%-------------------------------%%-----------------------------------------%
%-------------------------------%%-----------------------------------------%
% written by 钱思成, NO:21401019
% 利用Euler和改进Euler法进行求解u' = -5u, 当t=0时，u = 1
%EULER Summary of this function goes here
%   Detailed explanation goes here
a = 0;
b = 1;
h =input('Euler法steps h = ：');
t = a:h:b;
n = (b - a)/h;
u = zeros(1,n+1);
u(1) = 1;

u1 = zeros(1,n+1);
u1(1) = 1;
uu1 = zeros(1,n+1);
uu1(1) = 1;

ue = zeros(1,1+n);
ue(1) = 1;
uue = zeros(1,n+1);
uue(1) = 1;
for i = 1:n
    %% 显式Euler法迭代进行求解
    u(i+1) = u(i) + h*func(u(i));  
    
    %% 隐式Euler法迭代进行求解
    ue(i+1) = ue(i);
    j = 0;
    while j >=0
        uue(i+1) = ue(i) + h*(func(ue(i+1)));
        if abs(uue(i+1) - ue(i+1)) < 0.001  % 迭代控制收敛
            break;
        else
            j = j+1;
            ue(i+1) = uue(i+1);   % 用ue(i+1)替换uue(i+1),重新回带到迭代公式的左边
        end
        
    end    
    
    u1(i+1) = u1(i);     
    k = 0;
    %% 利用迭代法计算改进Euler法
    while k >=0 
        uu1(i+1) = u1(i) + (h/2)*(func(u1(i)) + func(u1(i+1))); 
        if abs(uu1(i+1) - u1(i+1)) < 0.001  % 迭代控制收敛
            break;
        else
            k = k+1;
            u1(i+1) = uu1(i+1);   % 用u1(i+1)替换uu1(i+1),重新回带到迭代公式的左边
        end
        
    end
    
end
u1 = uu1;
ue = uue;

uy = exp(-5*t);
plot(t,uy,'k-*')   %原函数图像
hold on 
plot(t,u,'r-o')    %显式Euler法图像
hold on
plot(t,ue,'g-o')   %隐式Euler法图像
hold on 
plot(t,u1,'y-o')   %改进Euler法图像
legend('原函数图像','显式Euler法图像','隐式Euler法图像','改进Euler法图像');
title('函数图像')
figure;

error = uy - u;
errore = uy - ue;
error1 = uy - u1;

plot(t,error,'r-o')     %显式Euler法图像误差
hold on 
plot(t,errore,'g-o')    %隐式Euler法图像误差
hold on
plot(t,error1,'y-o')    %改进Euler法图像误差
title('误差分析');
legend('显式Euler法误差分析','隐式Euler法图像误差','改进Euler法误差分析');


