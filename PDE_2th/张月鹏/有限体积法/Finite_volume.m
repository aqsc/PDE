%%有限体积法求解
%  -(pu')'=0
%  u(0)=1,u(1)=0;
%  p(x)为分段函数，当0<x<=a时，p(x)=p1;当a<p(x)<=1时，p(x)=p2;

clear;clc;close all;
breakpoint=0.5;p1=2;p2=8;  %此处的参数可以修改
%%交互式输入步长h
while 1
    h=inputdlg('请输入步长h（能够整除1）：','输入',1,{'0.05'});
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
ttemp=0:h:1;
T=1/h;
p=@(x)((x<=(breakpoint+1e-8)).*p1+(x>(breakpoint+1e-8)).*p2);   %设置p为匿名函数（在间断点点处加上一个微小量是为了处理matlab的内在的存贮误差）
%%求出矩阵F
F=zeros(T-1,1);   
F(1)=p(0.5*h)/h;
%%求出矩阵A
A=zeros(T-1,T-1);
for i=1:T-1
    A(i,i)=(p(ttemp(i+1)-0.5*h)+p(ttemp(i+1)+0.5*h))/h;
end
for i=1:T-2
    A(i,i+1)=-p(ttemp(i+1)+0.5*h)/h;
    A(i+1,i)=-p(ttemp(i+1)+0.5*h)/h;
end
U=A\F; %求解方程组
U=[1 ;U; 0];
%%绘图
plot(ttemp,U,'-o');
title(['有限体积法求解函数结果(h=',num2str(h),';p1=',num2str(p1),',p2=',num2str(p2),';函数p(x)的间断点为:',num2str(breakpoint),')']);
xlabel('x轴');ylabel('y轴')

%%结果分析
UD=zeros(T+1,1);
UD(2:end)=(U(2:end)-U(1:end-1))/h;
UD(1)=UD(2);
P=p(ttemp);
PU=P.*UD';
figure;
hold on;
plot(ttemp,UD,':or');
plot(ttemp,P,':og');
plot(ttemp,PU,'-*');
legend('u''(x)图像','p(x)图像','u''*p(x)图像')
title(['有限体积法结果分析(h=',num2str(h),';p1=',num2str(p1),',p2=',num2str(p2),';函数p(x)的间断点为:',num2str(breakpoint),')']);
xlabel('x轴');ylabel('y轴')
hold off















