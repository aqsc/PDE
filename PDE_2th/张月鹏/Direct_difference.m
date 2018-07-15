%%直接差分法求解
%  -(pu')'+ru'+qu=f  0<x<1
%  u(0)=0,u(1)=0;u(x)=1/4-(x-1/2)^2;p(x)=x^2+1;r(x)=x;q(x)=x^2;

clear;clc;close all;
t=0:0.001:1;
u=0.25-(t-0.5).^2;
%%交互式输入步长h
while 1
h=inputdlg('请输入步长h（能够整除1）：','输入',1,{'0.1'});
h=str2double(h);
if isnan(h)
   error=errordlg('输入未能正确转化为数值','错误');
   waitfor(error);
elseif 1/h~=fix(1/h)
   error=errordlg('输入步长h未能整除1','错误');
   waitfor(error);    
else
    break
end
end
h1=h*h;
ttemp=0:h:1;
T=1/h;
tt=ttemp(2:end-1);
f=inline('-x.^4+x.^3+4*x.^2-x+2');
p=inline('x^2+1');
%%求出矩阵F
F=f(tt)';   %因为边值都为零所以左端F可以统一化表示
%%求出矩阵A
A=zeros(T-1,T-1);
for i=1:T-1
    A(i,i)=(p(ttemp(i+1)-0.5*h)+p(ttemp(i+1)+0.5*h))/h1+ttemp(i+1)^2;
end
for i=1:T-2
    A(i,i+1)=-p(ttemp(i+1)+0.5*h)/h1+ttemp(i+1)/2/h;
    A(i+1,i)=-p(ttemp(i+1)+0.5*h)/h1-ttemp(i+2)/2/h;
end
U=A\F; %求解方程组
U=[0 ;U; 0];
%%绘图
hold on;
plot(t,u);
plot(ttemp,U,'or');
legend('原函数','直接差分法结果')
title(['直接差分法求解函数结果(h=',num2str(h),')']);
xlabel('x轴');ylabel('y轴')
hold off
figure
plot(ttemp,abs(U'-0.25+(ttemp-0.5).^2))
title(['直接差分法求解函数误差(h=',num2str(h),')']);
xlabel('x轴');ylabel('y轴')














