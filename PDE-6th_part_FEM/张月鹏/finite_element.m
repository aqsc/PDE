%% 两点边值的有限元法
%  -y''+PI*PI/4*y=PI*PI/2*sin(PI/2*x)     0<x<1
%  y(0)=0
%  y'(1)=0
clear;clc;close all;

%% 交互式输入h
while 1
    h=inputdlg({'请输入网格步长h（能够整除1）：'},'输入',1,{'0.05'});
    if isempty(h)
        error=errordlg('请输入数值','错误');
        waitfor(error);
        continue;
    end
    h=str2double(h);
    if isnan(h)
        error=errordlg('输入未能正确转化为数值','错误');
        waitfor(error);
    elseif 1/h~=fix(1/h)
        error=errordlg('输入未能满足整除关系','错误');
        waitfor(error);  
    else
        break
    end
end
%% 计算基本向量
x=0:h:1;
T=1/h;
%% 计算b向量
b=zeros(T,1);
for i=1:T-1   %分区间积分b
    m=x(i);m1=x(i+1);
    f1=@(x)pi*pi/2*sin(pi/2*(m+h*x)).*x;
    f2=@(x)pi*pi/2*sin(pi/2*(m1+h*x)).*(1-x);
    b(i)=(integral(f1,0,1)+integral(f2,0,1));   
end
m=x(T);
f1=@(x)(pi*pi/2*sin(pi/2*(m+h*x)).*x);
b(T)=integral(f1,0,1);         %最后一区间单独与其他同项少了一项
%% 计算A矩阵
A=zeros(T+1,T+1);
for i =2:T+1     %计算单元刚度矩阵
    A(i-1:i,i-1:i)=A(i-1:i,i-1:i)+[1,-1;-1,1]/h/h+pi*pi/4*[1/3,1/6;1/6,1/3];
end
A22=A(2:T+1,2:T+1);  %提取分块矩阵右下角
%% 求解方程组
U=A22\b;
U=[0;U]';
%% 绘图
x1=0:0.01:1;
figure('position',[300 300 1100 400]);
subplot(1,2,1);
hold on
Uture=sin(pi/2*x1); 
plot(x1,Uture);
plot(x,U,'or');
legend('原函数','差分逼近结果')
title(['有限元法(h=',num2str(h),')']);
xlabel('x轴');ylabel('u轴')
hold off
subplot(1,2,2);
plot(x,abs(U-sin(pi/2*x)));
title(['有限元法误差图(h=',num2str(h),')']);
xlabel('x轴');ylabel('u轴')








