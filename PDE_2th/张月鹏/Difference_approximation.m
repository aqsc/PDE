%%差分逼近法求解
% -u''+xu=(x-1)e^x
% u(0)=1,u(1)=e

clear;clc;close all;
t=0:0.001:1;
u=exp(t);
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
tt=ttemp(3:end-2);
%%求出矩阵F
F=zeros(T-1,1);
F(1)=(h-1)*exp(h)+1/h1;
F(2:end-1)=(tt-1).*exp(tt);
F(T-1)=(1-h-1)*exp(1-h)+exp(1)/h1;
%%求出矩阵A
A=zeros(T-1,T-1);
for i=1:T-1
    A(i,i)=2/h1+ttemp(i+1);
end
for i=1:T-2
    A(i,i+1)=-1/h1;
    A(i+1,i)=-1/h1;
end
U=A\F; %求解方程组
U=[1 ;U; exp(1)];
%%绘图
hold on;
plot(t,u);
plot(ttemp,U,'or');
legend('原函数','差分逼近法结果')
title(['差分逼近求解函数结果(h=',num2str(h),')']);
xlabel('x轴');ylabel('y轴')
hold off
figure
plot(ttemp,abs(U'-exp(ttemp)))
title(['差分逼近求解函数误差(h=',num2str(h),')']);
xlabel('x轴');ylabel('y轴')














