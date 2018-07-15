%%������������
%  -(pu')'=0
%  u(0)=1,u(1)=0;
%  p(x)Ϊ�ֶκ�������0<x<=aʱ��p(x)=p1;��a<p(x)<=1ʱ��p(x)=p2;

clear;clc;close all;
breakpoint=0.5;p1=2;p2=8;  %�˴��Ĳ��������޸�
%%����ʽ���벽��h
while 1
    h=inputdlg('�����벽��h���ܹ�����1����','����',1,{'0.05'});
    h=str2double(h);
    if isnan(h)
        error=errordlg('����δ����ȷת��Ϊ��ֵ','����');
        waitfor(error);
    elseif 1/h~=fix(1/h)
        error=errordlg('���벽��hδ������1','����');
        waitfor(error);    
    else
        break
    end
end
ttemp=0:h:1;
T=1/h;
p=@(x)((x<=(breakpoint+1e-8)).*p1+(x>(breakpoint+1e-8)).*p2);   %����pΪ�����������ڼ�ϵ�㴦����һ��΢С����Ϊ�˴���matlab�����ڵĴ�����
%%�������F
F=zeros(T-1,1);   
F(1)=p(0.5*h)/h;
%%�������A
A=zeros(T-1,T-1);
for i=1:T-1
    A(i,i)=(p(ttemp(i+1)-0.5*h)+p(ttemp(i+1)+0.5*h))/h;
end
for i=1:T-2
    A(i,i+1)=-p(ttemp(i+1)+0.5*h)/h;
    A(i+1,i)=-p(ttemp(i+1)+0.5*h)/h;
end
U=A\F; %��ⷽ����
U=[1 ;U; 0];
%%��ͼ
plot(ttemp,U,'-o');
title(['�����������⺯�����(h=',num2str(h),';p1=',num2str(p1),',p2=',num2str(p2),';����p(x)�ļ�ϵ�Ϊ:',num2str(breakpoint),')']);
xlabel('x��');ylabel('y��')

%%�������
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
legend('u''(x)ͼ��','p(x)ͼ��','u''*p(x)ͼ��')
title(['����������������(h=',num2str(h),';p1=',num2str(p1),',p2=',num2str(p2),';����p(x)�ļ�ϵ�Ϊ:',num2str(breakpoint),')']);
xlabel('x��');ylabel('y��')
hold off















