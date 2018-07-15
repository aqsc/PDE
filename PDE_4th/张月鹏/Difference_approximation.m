%% ˫�����̵Ĳ�ֱƽ���
%  u''(t)-u''(x)=0     t>0;0<x<1
%  u(x,0)=2sin(pi*x)
%  u(0,t)=0;u(1,t)=0
clear;clc;close all;

%% ����ʽ����h,tao,T
while 1
    htaoT=inputdlg({'���������񲽳�h���ܹ�����1����','������t�Ჽ��tao���ܹ�����ʱ��T����'...
        ,'����������ʱ��T���ܹ�������tao������'},'����',1,{'0.1','0.05','1'});
    if isempty(htaoT)
        error=errordlg('��������ֵ','����');
        waitfor(error);
        continue;
    end
    h=htaoT{1};tao=htaoT{2}; T=htaoT{3};    %hΪ���񲽳���taoΪt�Ჽ��,TΪ���ʱ��
    h=str2double(h);tao=str2double(tao); T=str2double(T);
    if isnan(h)||isnan(tao)||isnan(T)
        error=errordlg('����δ����ȷת��Ϊ��ֵ','����');
        waitfor(error);
    elseif 1/h~=fix(1/h)||T/tao~=fix(T/tao)
        error=errordlg('����δ������������ϵ','����');
        waitfor(error);  
    else
        break
    end
end
%% ������
x=0:h:1;t=0:tao:T;
Xn=1/h;Tn=T/tao;
U1=2*sin(pi*x);     %��ʼ��ʱ����һ��
U=zeros(1,Xn+1);U2=U;
r=tao/h;
e=ones(Xn-1,1);
C1=spdiags([r*r/2*e,(1-r*r)*e,r*r/2*e],-1:1,Xn-1,Xn-1);
U2(2:Xn)=C1*U1(2:Xn)';     %��ʼ��ʱ���ڶ���
C2=spdiags([r*r*e,2*(1-r*r)*e,r*r*e],-1:1,Xn-1,Xn-1);
for i=1:Tn-1    %�������Tʱ�̺���ֵ
    U(2:Xn)=(C2*U2(2:Xn)')'-U1(2:Xn);
    U1=U2;
    U2=U;
end
%% ��ͼ
x1=0:0.01:1;
figure('position',[300 300 1100 400]);
subplot(1,2,1);
hold on
Uture=sin(pi*(x1-T))+sin(pi*(x1+T)); 
plot(x1,Uture);
plot(x,U,'or');
legend('ԭ����','��ֱƽ����')
title(['��ֱƽ���(T=',num2str(T),';tao=',num2str(tao),';h=',num2str(h),')']);
xlabel('x��');ylabel('u��')
hold off
subplot(1,2,2);
plot(x,abs(U-sin(pi*(x-T))-sin(pi*(x+T))));
title(['��ֱƽ������ͼ(T=',num2str(T),';tao=',num2str(tao),';h=',num2str(h),')']);
xlabel('x��');ylabel('u��')








