%%����ַ����
%  ��u=2*pi^2*e^(pi*(x+y))(sin(pi*x)*cos(pi*y)+cos(pi*x)*sin(pi*y)),
%  (x,y)��G=(0,1)*(0,1)
%  u=0,(x,y)��boundary of G

clear;clc;close all;
%%����ʽ���벽��h
while 1
    h=inputdlg({'������x�Ჽ��h���ܹ�����1����','������y�Ჽ��h���ܹ�����1����'},'����',1,{'1/64','1/64'});
    if isempty(h)
        error=errordlg('��������ֵ','����');
        waitfor(error);
        continue;
    end
    hx=h{1};hy=h{2};     %hxΪx�Ჽ����hyΪy�Ჽ��
    hx=str2num(hx);hy=str2num(hy); 
    if isnan(hx)||isnan(hy)
        error=errordlg('����δ����ȷת��Ϊ��ֵ','����');
        waitfor(error);
    elseif 1/hx~=fix(1/hx)||1/hy~=fix(1/hy)
        error=errordlg('���벽��hδ������1','����');
        waitfor(error);    
    else
        break
    end
end

%%Ϊ���׼��������������;���
txtemp=0:hx:1;tytemp=0:hy:1;
tx=txtemp(2:end-1);ty=tytemp(2:end-1);
[t1,t2]=meshgrid(txtemp,tytemp);
Tx=1/hx;Ty=1/hy;
f=@(x,y)(2*pi^2*exp(pi*(x+y)).*(sin(pi*x).*cos(pi*y)+cos(pi*x).*sin(pi*y)));   %����fΪ��������
FF=-f(t1,t2); %��SOR��ʹ�� 

%%�������F
F=zeros(Tx-1,Ty-1);  
for i=1:Tx-1
    for j=1:Ty-1
        F(i,j)=-f(tx(i),ty(j));   %��Ϊ�߽�Ϊ0���Կ���ͳһ��ʾF
    end
end
F=reshape(F,(Tx-1)*(Ty-1),1);

%%�������A
Ax=zeros(Tx-1,Tx-1);
Ay=zeros(Ty-1,Ty-1);
hxx=hx*hx;hyy=hy*hy;
for i=1:Tx-1
    Ax(i,i)=2/hxx;
end
for i=1:Tx-2
    Ax(i,i+1)=-1/hxx;
    Ax(i+1,i)=-1/hxx;
end
for i=1:Ty-1
    Ay(i,i)=2/hyy;
end
for i=1:Ty-2
    Ay(i,i+1)=-1/hyy;
    Ay(i+1,i)=-1/hyy;
end
A=kron(eye(Ty-1),Ax)+kron(Ay,eye(Tx-1));

%%��ⷽ����
while 1   %����ʽѡ����ⷽ��
    str={'�����ݶȷ�','Ԥ�������ݶȷ�','SOR��Ĭ��y�Ჽ������x�ᣩ',...
        '������PR��Ĭ��y�Ჽ������x��,����ٶȽ�����','˫����PR��Ĭ��y�Ჽ������x��,����ٶȽ�����'};
    [selection,ok]=listdlg('PromptString','ѡ������','SelectionMode','single','ListString',str,...
        'OKString','ȷ��','CancelString','����','ListSize',[300,200]);
    if ok==0
        error=errordlg('��ѡ������','����');
        waitfor(error);
    else
        break;
    end
end

%%����ѡ��ķ������
switch selection
    case 1  %�����ݶȷ�
        tic
        [U,numstep]=CG(A,F,zeros((Tx-1)*(Ty-1),1));
        U=reshape(U,Tx-1,Ty-1);
        UU=zeros(Tx+1,Ty+1);
        UU(2:Tx,2:Ty)=U;
        msgbox({['�����ݶȷ���������Ϊ��',num2str(numstep)],['�����ݶȷ�����ʱ��Ϊ��',num2str(toc),'��']})
    case 2  %Ԥ�������ݶȷ�
        tic
        [U,numstep]=PreCG(A,F,zeros((Tx-1)*(Ty-1),1));
        U=reshape(U,Tx-1,Ty-1);
        UU=zeros(Tx+1,Ty+1);
        UU(2:Tx,2:Ty)=U;
        msgbox({['Ԥ�������ݶȷ���������Ϊ��',num2str(numstep)],['Ԥ�������ݶȷ�����ʱ��Ϊ��',num2str(toc),'��']})
    case 3  %SOR��
        tic
        [U,numstep]=SOR(FF,zeros(Ty+1,Tx+1),hx);
        UU=U';
        msgbox({['SOR����������Ϊ��',num2str(numstep)],['SOR������ʱ��Ϊ��',num2str(toc),'��']})
    case 4  %������PR��
        tic
        [U,numstep]=PR(kron(eye(Ty-1),Ax),kron(Ay,eye(Tx-1)),F,zeros((Tx-1)*(Ty-1),1),hx);
        U=reshape(U,Tx-1,Ty-1);
        UU=zeros(Tx+1,Ty+1);
        UU(2:Tx,2:Ty)=U;
        msgbox({['������PR����������Ϊ��',num2str(numstep)],['SOR������ʱ��Ϊ��',num2str(toc),'��']})
    case 5
        tic  %˫����PR��
        [U,numstep]=PRtwo(kron(eye(Ty-1),Ax),kron(Ay,eye(Tx-1)),F,zeros((Tx-1)*(Ty-1),1),hx);
        U=reshape(U,Tx-1,Ty-1);
        UU=zeros(Tx+1,Ty+1);
        UU(2:Tx,2:Ty)=U;
        msgbox({['˫����PR����������Ϊ��',num2str(numstep)],['SOR������ʱ��Ϊ��',num2str(toc),'��']})
end

%%��ͼ
hold on
txtemp1=0:0.01:1;tytemp1=0:0.01:1;
[txx,tyy]=meshgrid(txtemp1,tytemp1);
UTure=exp(pi*(txx+tyy)).*sin(pi*txx).*sin(pi*tyy);
CM=[0,1,0;1 0 0];colormap(CM);
surf(txx,tyy,UTure,zeros(size(UTure)));alpha(0.4);shading interp;
mesh(t1,t2,UU',ones(size(UU')));alpha(0.4);
legend('ԭͼ��','���ͼ��');view(-37.5,30);
title(['����ַ���⺯�����(hx=',num2str(hx),';hy=',num2str(hy),')']);
xlabel('x��');ylabel('y��')
hold off
figure
Uerror=abs(exp(pi*(t1+t2)).*sin(pi*t1).*sin(pi*t2)-UU');
mesh(t1,t2,Uerror);
title(['����ַ�������(hx=',num2str(hx),';hy=',num2str(hy),')']);
xlabel('x��');ylabel('y��')












