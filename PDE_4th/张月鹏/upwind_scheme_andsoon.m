%% 初值问题的差分逼近
%  u'(t)+u'(x)=0     t>0;x>0
%  u(x,0)=|x-1|
%  u(0,t)=1
clear;clc;close all;

%% 交互式输入h,H,tao,T
while 1
    hHtaoT=inputdlg({'请输入网格步长h（能够整除长度H）：','请输入x轴长度H（能够被步长h整除）','请输入t轴步长tao（能够整除时间T）：'...
        ,'请输入求解的时间T（能够被步长tao整除）'},'输入',1,{'0.5','10','0.5','1'});
    if isempty(hHtaoT)
        error=errordlg('请输入数值','错误');
        waitfor(error);
        continue;
    end
    h=hHtaoT{1};H=hHtaoT{2};tao=hHtaoT{3}; T=hHtaoT{4};    %h为网格步长，H为x轴长度，tao为t轴步长,T为求解时间
    h=str2double(h); H=str2double(H);tao=str2double(tao); T=str2double(T);
    if isnan(h)||isnan(tao)||isnan(T)||isnan(H)
        error=errordlg('输入未能正确转化为数值','错误');
        waitfor(error);
    elseif H/h~=fix(H/h)||T/tao~=fix(T/tao)
        error=errordlg('输入未能满足整除关系','错误');
        waitfor(error);  
    else
        break
    end
end
%% 为求解准备所需基本向量和矩阵
x=0:h:H;t=0:tao:T;
Xn=H/h;Tn=T/tao;
U1=abs(x-1);
U=ones(1,Xn+1);
r=tao/h;
e=ones(Xn,1);     
%% 交互式选择求解方法
while 1   
    str={'显式迎风格式','隐式迎风格式','Lax-Friedrichs格式','Box Scheme格式','Lax-Wendroff格式'};
    [selection,ok]=listdlg('PromptString','选择处理方法','SelectionMode','single','ListString',str,...
        'OKString','确认','CancelString','放弃','ListSize',[200,200]);
    if ok==0
        error=errordlg('请选择处理方法','错误');
        waitfor(error);
    else
        break;
    end
end
%% 根据选择的方法求解
switch selection
    case 1 
        %%显式迎风格式
        S='显式迎风格式';
        C=spdiags([r*e,(1-r)*e],-1:0,Xn,Xn);
        for i=1:Tn
            U(2:Xn+1)=(C*U1(2:Xn+1)')';
            U(2)=U(2)+r;
            U1=U;
        end
    case 2  
        %隐式迎风格式
        S='隐式迎风格式';
        C=spdiags([-r*e,(1+r)*e],-1:0,Xn,Xn);  
        for i=1:Tn
            U1(2)=U1(2)+r;
            U(2:Xn+1)=C\U1(2:Xn+1)';
            U1=U;
        end
    case 3  
        %Lax-Friedrichs格式
        S='Lax-Friedrichs格式';
        C=spdiags([(1+r)/2*e,0*e,(1-r)/2*e],-1:1,Xn,Xn);
        for i=1:Tn
            U(2:Xn+1)=(C*U1(2:Xn+1)')';
            U(2)=U(2)+(1+r)/2;
            U1=U;
        end
    case 4  
        %Box Scheme格式
        S='Box Scheme格式';
        C1=spdiags([(1-r)*e,(1+r)*e],-1:0,Xn,Xn);
        C2=spdiags([(1+r)*e,(1-r)*e],-1:0,Xn,Xn);
        for i=1:Tn
            U1(2:Xn+1)=C2*U1(2:Xn+1)';
            U1(2)=U1(2)+2*r;
            U(2:Xn+1)=(C1\U1(2:Xn+1)')';
            U1=U;
        end
        case 5  
        %Lax-Wendroff格式
        S='Lax-Wendroff格式';
        C=spdiags([(r+r*r)/2*e,(1-r*r)*e,(-r+r*r)/2*e],-1:1,Xn,Xn);
        for i=1:Tn
            U(2:Xn+1)=(C*U1(2:Xn+1)')';
            U(2)=U(2)+(r+r*r)/2;
            U1=U;
        end
end
%% 绘图
x1=0:0.01:H;
hold on
Uture=((x1-T)<=0)+(1-x1+T).*((x1-T)>0&(x1-T)<=1)+(x1-T-1).*((x1-T)>1); 
plot(x1,Uture);
plot(x,U,'or');
legend('原函数',[S,'结果'])
title([S,'求解函数图象(T=',num2str(T),';tao=',num2str(tao),';h=',num2str(h),')']);
xlabel('x轴');ylabel('u轴')
hold off











