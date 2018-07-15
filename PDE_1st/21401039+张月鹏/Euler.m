clear;clc;close all;
%%h=0.1
t=0:0.001:1;
u=exp(-5*t);
h=0.1;
tt=0:h:1;
T=1/h;
%%显式欧拉法
u11(1)=1;
for i=1:T
  u11(i+1)=u11(i)+h*-5*u11(i);
end
%%隐式欧拉法
u21(1)=1;
for i=1:T
  u21(i+1)=u21(i)/(h*5+1);
end
%%改进欧拉法
u31(1)=1;
for i=1:T
    u31(i+1)=u31(i)*(-5*h+2)/(5*h+2);
end
hold on;
plot(t,u);
plot(tt,u11,'or');
plot(tt,u21,'oc');
plot(tt,u31,'om');
legend('原图像','显式欧拉法','隐式欧拉法','改进欧拉法')
title('欧拉法(h=0.1)')
xlabel('x轴');ylabel('y轴')
hold off

%%h=0.05
figure
h=0.05;
tt=0:h:1;
T=1/h;
%%显式欧拉法
u1(1)=1;
for i=1:T
  u1(i+1)=u1(i)+h*-5*u1(i);
end
%%隐式欧拉法
u2(1)=1;
for i=1:T
  u2(i+1)=u2(i)/(h*5+1);
end
%%改进欧拉法
u3(1)=1;
for i=1:T
  u3(i+1)=u3(i)*(-5*h+2)/(5*h+2);
end
hold on;
plot(t,u);
plot(tt,u1,'or');
plot(tt,u2,'oc');
plot(tt,u3,'om');
legend('原图像','显式欧拉法','隐式欧拉法','改进欧拉法')
title('欧拉法(h=0.05)')
xlabel('x轴');ylabel('y轴')
hold off;



