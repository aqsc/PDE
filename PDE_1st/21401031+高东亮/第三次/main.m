clc
close all
t=0:0.001:2;                           %Ô­º¯Êý
v=(1+t.^2).^2;
plot(t,v)
hold on
h=0.1;                                
t=0:0.1:2;
u=RungeKutta(h);
plot(t,u,'r*-')
hold on
h=0.5;
t=0:0.5:2;
u=RungeKutta(h);
plot(t,u,'go-')
hold on
h=1;
t=0:1:2;
u=RungeKutta(h);
plot(t,u,'ks-')
title('Runge-Kutta')
xlabel('t')
ylabel('u')
legend('Object Function','h=0.1','h=0.5','h=1','Location','NorthWest')
hold off