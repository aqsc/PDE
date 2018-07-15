%%ֱ�Ӳ�ַ����
%  -(pu')'+ru'+qu=f  0<x<1
%  u(0)=0,u(1)=0;u(x)=1/4-(x-1/2)^2;p(x)=x^2+1;r(x)=x;q(x)=x^2;

clear;clc;close all;
t=0:0.001:1;
u=0.25-(t-0.5).^2;
%%����ʽ���벽��h
while 1
h=inputdlg('�����벽��h���ܹ�����1����','����',1,{'0.1'});
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
h1=h*h;
ttemp=0:h:1;
T=1/h;
tt=ttemp(2:end-1);
f=inline('-x.^4+x.^3+4*x.^2-x+2');
p=inline('x^2+1');
%%�������F
F=f(tt)';   %��Ϊ��ֵ��Ϊ���������F����ͳһ����ʾ
%%�������A
A=zeros(T-1,T-1);
for i=1:T-1
    A(i,i)=(p(ttemp(i+1)-0.5*h)+p(ttemp(i+1)+0.5*h))/h1+ttemp(i+1)^2;
end
for i=1:T-2
    A(i,i+1)=-p(ttemp(i+1)+0.5*h)/h1+ttemp(i+1)/2/h;
    A(i+1,i)=-p(ttemp(i+1)+0.5*h)/h1-ttemp(i+2)/2/h;
end
U=A\F; %��ⷽ����
U=[0 ;U; 0];
%%��ͼ
hold on;
plot(t,u);
plot(ttemp,U,'or');
legend('ԭ����','ֱ�Ӳ�ַ����')
title(['ֱ�Ӳ�ַ���⺯�����(h=',num2str(h),')']);
xlabel('x��');ylabel('y��')
hold off
figure
plot(ttemp,abs(U'-0.25+(ttemp-0.5).^2))
title(['ֱ�Ӳ�ַ���⺯�����(h=',num2str(h),')']);
xlabel('x��');ylabel('y��')














