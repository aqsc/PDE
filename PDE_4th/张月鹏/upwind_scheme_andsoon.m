%% ��ֵ����Ĳ�ֱƽ�
%  u'(t)+u'(x)=0     t>0;x>0
%  u(x,0)=|x-1|
%  u(0,t)=1
clear;clc;close all;

%% ����ʽ����h,H,tao,T
while 1
    hHtaoT=inputdlg({'���������񲽳�h���ܹ���������H����','������x�᳤��H���ܹ�������h������','������t�Ჽ��tao���ܹ�����ʱ��T����'...
        ,'����������ʱ��T���ܹ�������tao������'},'����',1,{'0.5','10','0.5','1'});
    if isempty(hHtaoT)
        error=errordlg('��������ֵ','����');
        waitfor(error);
        continue;
    end
    h=hHtaoT{1};H=hHtaoT{2};tao=hHtaoT{3}; T=hHtaoT{4};    %hΪ���񲽳���HΪx�᳤�ȣ�taoΪt�Ჽ��,TΪ���ʱ��
    h=str2double(h); H=str2double(H);tao=str2double(tao); T=str2double(T);
    if isnan(h)||isnan(tao)||isnan(T)||isnan(H)
        error=errordlg('����δ����ȷת��Ϊ��ֵ','����');
        waitfor(error);
    elseif H/h~=fix(H/h)||T/tao~=fix(T/tao)
        error=errordlg('����δ������������ϵ','����');
        waitfor(error);  
    else
        break
    end
end
%% Ϊ���׼��������������;���
x=0:h:H;t=0:tao:T;
Xn=H/h;Tn=T/tao;
U1=abs(x-1);
U=ones(1,Xn+1);
r=tao/h;
e=ones(Xn,1);     
%% ����ʽѡ����ⷽ��
while 1   
    str={'��ʽӭ���ʽ','��ʽӭ���ʽ','Lax-Friedrichs��ʽ','Box Scheme��ʽ','Lax-Wendroff��ʽ'};
    [selection,ok]=listdlg('PromptString','ѡ������','SelectionMode','single','ListString',str,...
        'OKString','ȷ��','CancelString','����','ListSize',[200,200]);
    if ok==0
        error=errordlg('��ѡ������','����');
        waitfor(error);
    else
        break;
    end
end
%% ����ѡ��ķ������
switch selection
    case 1 
        %%��ʽӭ���ʽ
        S='��ʽӭ���ʽ';
        C=spdiags([r*e,(1-r)*e],-1:0,Xn,Xn);
        for i=1:Tn
            U(2:Xn+1)=(C*U1(2:Xn+1)')';
            U(2)=U(2)+r;
            U1=U;
        end
    case 2  
        %��ʽӭ���ʽ
        S='��ʽӭ���ʽ';
        C=spdiags([-r*e,(1+r)*e],-1:0,Xn,Xn);  
        for i=1:Tn
            U1(2)=U1(2)+r;
            U(2:Xn+1)=C\U1(2:Xn+1)';
            U1=U;
        end
    case 3  
        %Lax-Friedrichs��ʽ
        S='Lax-Friedrichs��ʽ';
        C=spdiags([(1+r)/2*e,0*e,(1-r)/2*e],-1:1,Xn,Xn);
        for i=1:Tn
            U(2:Xn+1)=(C*U1(2:Xn+1)')';
            U(2)=U(2)+(1+r)/2;
            U1=U;
        end
    case 4  
        %Box Scheme��ʽ
        S='Box Scheme��ʽ';
        C1=spdiags([(1-r)*e,(1+r)*e],-1:0,Xn,Xn);
        C2=spdiags([(1+r)*e,(1-r)*e],-1:0,Xn,Xn);
        for i=1:Tn
            U1(2:Xn+1)=C2*U1(2:Xn+1)';
            U1(2)=U1(2)+2*r;
            U(2:Xn+1)=(C1\U1(2:Xn+1)')';
            U1=U;
        end
        case 5  
        %Lax-Wendroff��ʽ
        S='Lax-Wendroff��ʽ';
        C=spdiags([(r+r*r)/2*e,(1-r*r)*e,(-r+r*r)/2*e],-1:1,Xn,Xn);
        for i=1:Tn
            U(2:Xn+1)=(C*U1(2:Xn+1)')';
            U(2)=U(2)+(r+r*r)/2;
            U1=U;
        end
end
%% ��ͼ
x1=0:0.01:H;
hold on
Uture=((x1-T)<=0)+(1-x1+T).*((x1-T)>0&(x1-T)<=1)+(x1-T-1).*((x1-T)>1); 
plot(x1,Uture);
plot(x,U,'or');
legend('ԭ����',[S,'���'])
title([S,'��⺯��ͼ��(T=',num2str(T),';tao=',num2str(tao),';h=',num2str(h),')']);
xlabel('x��');ylabel('u��')
hold off











