clear; clc;close all
%%四阶Runge-Kutta法
t=0:0.001:2;
u=(1+t.^2).^2;
%h=0.1
h=0.1;
tt=0:h:2;
T=2/h;
uu(1)=1;
for i=1:T
    k1=4*tt(i)*sqrt(uu(i));
    k2=4*(tt(i)+0.5*h)*sqrt(uu(i)+0.5*h*k1);
    k3=4*(tt(i)+0.5*h)*sqrt(uu(i)+0.5*h*k2);
    k4=4*(tt(i)+h)*sqrt(uu(i)+h*k3);
    uu(i+1)=uu(i)+h/6*(k1+2*k2+2*k3+k4);
end
%h=0.5
h=0.5;
tt1=0:h:2;
T=2/h;
uu1(1)=1;
for i=1:T
    k1=4*tt1(i)*sqrt(uu1(i));
    k2=4*(tt1(i)+0.5*h)*sqrt(uu1(i)+0.5*h*k1);
    k3=4*(tt1(i)+0.5*h)*sqrt(uu1(i)+0.5*h*k2);
    k4=4*(tt1(i)+h)*sqrt(uu1(i)+h*k3);
    uu1(i+1)=uu1(i)+h/6*(k1+2*k2+2*k3+k4);
end
%h=1
h=1;
tt11=0:h:2;
T=2/h;
uu11(1)=1;
for i=1:T
    k1=4*tt11(i)*sqrt(uu11(i));
    k2=4*(tt11(i)+0.5*h)*sqrt(uu11(i)+0.5*h*k1);
    k3=4*(tt11(i)+0.5*h)*sqrt(uu11(i)+0.5*h*k2);
    k4=4*(tt11(i)+h)*sqrt(uu11(i)+h*k3);
    uu11(i+1)=uu11(i)+h/6*(k1+2*k2+2*k3+k4);
end
hold on;
plot(t,u);
plot(tt,uu,'xm');
plot(tt1,uu1,'+c');
plot(tt11,uu11,'or');
legend('原图像','h=0.1','h=0.5','h=1')
title('四阶Runge-Kutta法')
xlabel('x轴');ylabel('y轴')
hold off;
figure;
hold on;
plot(tt,abs((1+tt.^2).^2-uu),'xm-');
plot(tt1,abs((1+tt1.^2).^2-uu1),'+c-');
plot(tt11,abs((1+tt11.^2).^2-uu11),'or-');
legend('原图像','h=0.1','h=0.5','h=1')
title('四阶Runge-Kutta法误差图')
xlabel('x轴');ylabel('y轴')
hold off;

