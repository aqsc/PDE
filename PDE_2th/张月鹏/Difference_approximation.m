%%��ֱƽ������
% -u''+xu=(x-1)e^x
% u(0)=1,u(1)=e

clear;clc;close all;
t=0:0.001:1;
u=exp(t);
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
tt=ttemp(3:end-2);
%%�������F
F=zeros(T-1,1);
F(1)=(h-1)*exp(h)+1/h1;
F(2:end-1)=(tt-1).*exp(tt);
F(T-1)=(1-h-1)*exp(1-h)+exp(1)/h1;
%%�������A
A=zeros(T-1,T-1);
for i=1:T-1
    A(i,i)=2/h1+ttemp(i+1);
end
for i=1:T-2
    A(i,i+1)=-1/h1;
    A(i+1,i)=-1/h1;
end
U=A\F; %��ⷽ����
U=[1 ;U; exp(1)];
%%��ͼ
hold on;
plot(t,u);
plot(ttemp,U,'or');
legend('ԭ����','��ֱƽ������')
title(['��ֱƽ���⺯�����(h=',num2str(h),')']);
xlabel('x��');ylabel('y��')
hold off
figure
plot(ttemp,abs(U'-exp(ttemp)))
title(['��ֱƽ���⺯�����(h=',num2str(h),')']);
xlabel('x��');ylabel('y��')














