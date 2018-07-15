%% �����ֵ������Ԫ��
%  -y''+PI*PI/4*y=PI*PI/2*sin(PI/2*x)     0<x<1
%  y(0)=0
%  y'(1)=0
clear;clc;close all;

%% ����ʽ����h
while 1
    h=inputdlg({'���������񲽳�h���ܹ�����1����'},'����',1,{'0.05'});
    if isempty(h)
        error=errordlg('��������ֵ','����');
        waitfor(error);
        continue;
    end
    h=str2double(h);
    if isnan(h)
        error=errordlg('����δ����ȷת��Ϊ��ֵ','����');
        waitfor(error);
    elseif 1/h~=fix(1/h)
        error=errordlg('����δ������������ϵ','����');
        waitfor(error);  
    else
        break
    end
end
%% �����������
x=0:h:1;
T=1/h;
%% ����b����
b=zeros(T,1);
for i=1:T-1   %���������b
    m=x(i);m1=x(i+1);
    f1=@(x)pi*pi/2*sin(pi/2*(m+h*x)).*x;
    f2=@(x)pi*pi/2*sin(pi/2*(m1+h*x)).*(1-x);
    b(i)=(integral(f1,0,1)+integral(f2,0,1));   
end
m=x(T);
f1=@(x)(pi*pi/2*sin(pi/2*(m+h*x)).*x);
b(T)=integral(f1,0,1);         %���һ���䵥��������ͬ������һ��
%% ����A����
A=zeros(T+1,T+1);
for i =2:T+1     %���㵥Ԫ�նȾ���
    A(i-1:i,i-1:i)=A(i-1:i,i-1:i)+[1,-1;-1,1]/h/h+pi*pi/4*[1/3,1/6;1/6,1/3];
end
A22=A(2:T+1,2:T+1);  %��ȡ�ֿ�������½�
%% ��ⷽ����
U=A22\b;
U=[0;U]';
%% ��ͼ
x1=0:0.01:1;
figure('position',[300 300 1100 400]);
subplot(1,2,1);
hold on
Uture=sin(pi/2*x1); 
plot(x1,Uture);
plot(x,U,'or');
legend('ԭ����','��ֱƽ����')
title(['����Ԫ��(h=',num2str(h),')']);
xlabel('x��');ylabel('u��')
hold off
subplot(1,2,2);
plot(x,abs(U-sin(pi/2*x)));
title(['����Ԫ�����ͼ(h=',num2str(h),')']);
xlabel('x��');ylabel('u��')








