clear;clc;close all
%% qian
% -----solve for the equation Ku = b with FEM algorithm
% -----based on Ritz Algprithm
% -----written by Qian sicheng on 15th MAY
% -----CPU I7/32G RAM
% -----如果在等步长的情况下，发现数值解效果很好，达到10^(-4)精度
% -----在非均匀分割的情况下，经运行多次，发现效果还可以，不过精度没有像均匀分割的高
%%
num_steps = 20;              % 分割数
%% non-uniform steps
% x = rand(1,num_steps-1); 
% x = sort(x);
% x = [0 x 1];        
% h = zeros(1,num_steps);
% for i = 1:num_steps
%     h(i) = x(i+1) - x(i);
% end
%% uniform steps
for i = 1:num_steps
    h(i) = 1/num_steps;
end
x = 0:h:1;
%%
p = 1;
q = pi^2/4;
syms kesi
%% define right-vector---b
f_ = zeros(num_steps,1);
b = zeros(num_steps,1);
for j = 1:num_steps-1
%     kesi = (x0 - x(j-1))/h(j);
    f_1 = h(j)*double(int(f(x(j) + h(j)*kesi)*kesi,kesi,0,1));
    f_2 = h(j+1)*double(int(f(x(j+1) + h(j+1)*kesi)*(1-kesi),kesi,0,1));
    b(j) = f_1 + f_2;
end
% kesi = (x0 - x(num_steps))/h(num_steps);
b(num_steps) = h(num_steps)*double(int(f(x(num_steps)+h(num_steps)*kesi)*kesi,kesi,0,1));
%% define total siffness matrix----K
K = zeros(num_steps);
for i=2:num_steps    
    a = zeros(num_steps);
%     kesi = (x0 - x(i-1))/h(i);
    a(i-1,i-1) = double(int(1/h(i) + h(i)*pi^2/4*(1 - kesi)^2, kesi, 0, 1));
    a(i,i) = double(int(1/h(i) + h(i)*pi^2/4*kesi^2, kesi, 0, 1));
    a(i-1,i) = double(int(-1/h(i) + h(i)*pi^2/4*kesi*(1 - kesi),kesi,0,1));
    a(i,i-1) = a(i-1,i); 
    if i == 2
        a(1,1) = a(1,1) + a(2,2); 
        K = K + a;
    else
        K = K + a;
    end
end
%% draw 
y = sin(pi/2*x);
plot(x,sin(pi/2*x),'r')
hold on 
u = K\b;
u = [0;u];
plot(x,u,'b')
legend('true image','numerical image')
title('compare the true image with mumerical image')
saveas(gcf,strcat('compare1-uniform_steps',num2str(num_steps),'.jpg'));
figure
error = u' - y;
plot(x,error)
title('error image');
saveas(gcf,strcat('error1-uniform_steps',num2str(num_steps),'.jpg'));

