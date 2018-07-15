%% 双曲方程的差分逼近法
%  u''(t)-u''(x)=0     t>0;0<x<1
%  u(x,0)=2sin(pi*x)
%  u(0,t)=0;u(1,t)=0
clear;clc;close all;

%% 交互式输入h,tao,T
while 1
    htaoT=inputdlg({'请输入网格步长h（能够整除1）：','请输入t轴步长tao（能够整除时间T）：'...
        ,'请输入求解的时间T（能够被步长tao整除）'},'输入',1,{'0.1','0.05','1'});
    if isempty(htaoT)
        error=errordlg('请输入数值','错误');
        waitfor(error);
        continue;
    end
    h=htaoT{1};tao=htaoT{2}; T=htaoT{3};    %h为网格步长，tao为t轴步长,T为求解时间
    h=str2double(h);tao=str2double(tao); T=str2double(T);
    if isnan(h)||isnan(tao)||isnan(T)
        error=errordlg('输入未能正确转化为数值','错误');
        waitfor(error);
    elseif 1/h~=fix(1/h)||T/tao~=fix(T/tao)
        error=errordlg('输入未能满足整除关系','错误');
        waitfor(error);  
    else
        break
    end
end
%% 求解过程
x=0:h:1;t=0:tao:T;
Xn=1/h;Tn=T/tao;
U1=2*sin(pi*x);     %初始化时间层第一层
U=zeros(1,Xn+1);U2=U;
r=tao/h;
e=ones(Xn-1,1);
C1=spdiags([r*r/2*e,(1-r*r)*e,r*r/2*e],-1:1,Xn-1,Xn-1);
U2(2:Xn)=C1*U1(2:Xn)';     %初始化时间层第二层
C2=spdiags([r*r*e,2*(1-r*r)*e,r*r*e],-1:1,Xn-1,Xn-1);
for i=1:Tn-1    %迭代求解T时刻函数值
    U(2:Xn)=(C2*U2(2:Xn)')'-U1(2:Xn);
    U1=U2;
    U2=U;
end
%% 绘图
x1=0:0.01:1;
figure('position',[300 300 1100 400]);
subplot(1,2,1);
hold on
Uture=sin(pi*(x1-T))+sin(pi*(x1+T)); 
plot(x1,Uture);
plot(x,U,'or');
legend('原函数','差分逼近结果')
title(['差分逼近法(T=',num2str(T),';tao=',num2str(tao),';h=',num2str(h),')']);
xlabel('x轴');ylabel('u轴')
hold off
subplot(1,2,2);
plot(x,abs(U-sin(pi*(x-T))-sin(pi*(x+T))));
title(['差分逼近法误差图(T=',num2str(T),';tao=',num2str(tao),';h=',num2str(h),')']);
xlabel('x轴');ylabel('u轴')








