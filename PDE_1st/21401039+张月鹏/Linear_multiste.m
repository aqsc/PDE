clear ;clc;close all
%%h=0.1
t=0:0.001:1;
u=exp(-5*t);
h=0.1;
tt=0:h:1;
T=1/h;
u13(1)=1;
%改进欧拉法
for i=1:T
  u13(i+1)=u13(i)*(-5*h+2)/(5*h+2);
end
%Adams外插法
for i=1:4
    u14(i)=u13(i);
end
for i=4:T
    u14(i+1)=u14(i)+h/24*(-5)*(55*u14(i)-59*u14(i-1)+37*u14(i-2)-9*u14(i-3));
end
%Adams内插法
for i=1:3
    u15(i)=u13(i);
end
for i=3:T
    u15(i+1)=(u15(i)+h/24*-5*(19*u15(i)-5*u15(i-1)+u15(i-2)))/(1+h*9*5/24);
end
hold on;
plot(t,u);
plot(tt,u13,'or');
plot(tt,u14,'+c');
plot(tt,u15,'xm');
legend('原图像','改进欧拉法','Adams外插法','Adams内插法')
title('欧拉法与线性多步法对比图(h=0.1)')
xlabel('x轴');ylabel('y轴')
hold off;
figure;
hold on;
plot(tt,abs(exp(-5*tt)-u13),'or-');
plot(tt,abs(exp(-5*tt)-u14),'+c-');
plot(tt,abs(exp(-5*tt)-u15),'xm-');
legend('改进欧拉法','Adams外插法','Adams内插法')
title('欧拉法与线性多步法误差图(h=0.1)')
xlabel('x轴');ylabel('y轴')
hold off;
figure;

%%h=0.05
h=0.05;
tt=0:h:1;
T=1/h;
u3(1)=1;
%改进欧拉法
for i=1:T
  u3(i+1)=u3(i)*(-5*h+2)/(5*h+2);
end
%Adams外插法
for i=1:4
    u4(i)=u3(i);
end
for i=4:T
    u4(i+1)=u4(i)+h/24*-5*(55*u4(i)-59*u4(i-1)+37*u4(i-2)-9*u4(i-3));
end
%Adams内插法
for i=1:3
    u5(i)=u3(i);
end
for i=3:T
    u5(i+1)=(u5(i)+h/24*-5*(19*u5(i)-5*u5(i-1)+u5(i-2)))/(1+h*9*5/24);
end
hold on;
plot(t,u);
plot(tt,u3,'or');
plot(tt,u4,'+c');
plot(tt,u5,'xm');
legend('原图像','改进欧拉法','Adams外插法','Adams内插法')
title('欧拉法与线性多步法对比图(h=0.05)')
xlabel('x轴');ylabel('y轴')
hold off;
figure;
hold on;
plot(tt,abs(exp(-5*tt)-u3),'or-');
plot(tt,abs(exp(-5*tt)-u4),'+c-');
plot(tt,abs(exp(-5*tt)-u5),'xm-');
legend('改进欧拉法','Adams外插法','Adams内插法')
title('欧拉法与线性多步法误差图(h=0.05)')
xlabel('x轴');ylabel('y轴')
hold off;



