%%五点差分法求解
%  △u=2*pi^2*e^(pi*(x+y))(sin(pi*x)*cos(pi*y)+cos(pi*x)*sin(pi*y)),
%  (x,y)∈G=(0,1)*(0,1)
%  u=0,(x,y)∈boundary of G

clear;clc;close all;
%%交互式输入步长h
while 1
    h=inputdlg({'请输入x轴步长h（能够整除1）：','请输入y轴步长h（能够整除1）：'},'输入',1,{'1/64','1/64'});
    if isempty(h)
        error=errordlg('请输入数值','错误');
        waitfor(error);
        continue;
    end
    hx=h{1};hy=h{2};     %hx为x轴步长，hy为y轴步长
    hx=str2num(hx);hy=str2num(hy); 
    if isnan(hx)||isnan(hy)
        error=errordlg('输入未能正确转化为数值','错误');
        waitfor(error);
    elseif 1/hx~=fix(1/hx)||1/hy~=fix(1/hy)
        error=errordlg('输入步长h未能整除1','错误');
        waitfor(error);    
    else
        break
    end
end

%%为求解准备所需基本向量和矩阵
txtemp=0:hx:1;tytemp=0:hy:1;
tx=txtemp(2:end-1);ty=tytemp(2:end-1);
[t1,t2]=meshgrid(txtemp,tytemp);
Tx=1/hx;Ty=1/hy;
f=@(x,y)(2*pi^2*exp(pi*(x+y)).*(sin(pi*x).*cos(pi*y)+cos(pi*x).*sin(pi*y)));   %设置f为匿名函数
FF=-f(t1,t2); %供SOR法使用 

%%求出矩阵F
F=zeros(Tx-1,Ty-1);  
for i=1:Tx-1
    for j=1:Ty-1
        F(i,j)=-f(tx(i),ty(j));   %因为边界为0所以可以统一标示F
    end
end
F=reshape(F,(Tx-1)*(Ty-1),1);

%%求出矩阵A
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

%%求解方程组
while 1   %交互式选择求解方法
    str={'共轭梯度法','预处理共轭梯度法','SOR（默认y轴步长等于x轴）',...
        '单参数PR（默认y轴步长等于x轴,求解速度较慢）','双参数PR（默认y轴步长等于x轴,求解速度较慢）'};
    [selection,ok]=listdlg('PromptString','选择处理方法','SelectionMode','single','ListString',str,...
        'OKString','确认','CancelString','放弃','ListSize',[300,200]);
    if ok==0
        error=errordlg('请选择处理方法','错误');
        waitfor(error);
    else
        break;
    end
end

%%根据选择的方法求解
switch selection
    case 1  %共轭梯度法
        tic
        [U,numstep]=CG(A,F,zeros((Tx-1)*(Ty-1),1));
        U=reshape(U,Tx-1,Ty-1);
        UU=zeros(Tx+1,Ty+1);
        UU(2:Tx,2:Ty)=U;
        msgbox({['共轭梯度法迭代步数为：',num2str(numstep)],['共轭梯度法运行时间为：',num2str(toc),'秒']})
    case 2  %预处理共轭梯度法
        tic
        [U,numstep]=PreCG(A,F,zeros((Tx-1)*(Ty-1),1));
        U=reshape(U,Tx-1,Ty-1);
        UU=zeros(Tx+1,Ty+1);
        UU(2:Tx,2:Ty)=U;
        msgbox({['预处理共轭梯度法迭代步数为：',num2str(numstep)],['预处理共轭梯度法运行时间为：',num2str(toc),'秒']})
    case 3  %SOR法
        tic
        [U,numstep]=SOR(FF,zeros(Ty+1,Tx+1),hx);
        UU=U';
        msgbox({['SOR法迭代步数为：',num2str(numstep)],['SOR法运行时间为：',num2str(toc),'秒']})
    case 4  %单参数PR法
        tic
        [U,numstep]=PR(kron(eye(Ty-1),Ax),kron(Ay,eye(Tx-1)),F,zeros((Tx-1)*(Ty-1),1),hx);
        U=reshape(U,Tx-1,Ty-1);
        UU=zeros(Tx+1,Ty+1);
        UU(2:Tx,2:Ty)=U;
        msgbox({['单参数PR法迭代步数为：',num2str(numstep)],['SOR法运行时间为：',num2str(toc),'秒']})
    case 5
        tic  %双参数PR法
        [U,numstep]=PRtwo(kron(eye(Ty-1),Ax),kron(Ay,eye(Tx-1)),F,zeros((Tx-1)*(Ty-1),1),hx);
        U=reshape(U,Tx-1,Ty-1);
        UU=zeros(Tx+1,Ty+1);
        UU(2:Tx,2:Ty)=U;
        msgbox({['双参数PR法迭代步数为：',num2str(numstep)],['SOR法运行时间为：',num2str(toc),'秒']})
end

%%绘图
hold on
txtemp1=0:0.01:1;tytemp1=0:0.01:1;
[txx,tyy]=meshgrid(txtemp1,tytemp1);
UTure=exp(pi*(txx+tyy)).*sin(pi*txx).*sin(pi*tyy);
CM=[0,1,0;1 0 0];colormap(CM);
surf(txx,tyy,UTure,zeros(size(UTure)));alpha(0.4);shading interp;
mesh(t1,t2,UU',ones(size(UU')));alpha(0.4);
legend('原图像','求解图像');view(-37.5,30);
title(['五点差分法求解函数结果(hx=',num2str(hx),';hy=',num2str(hy),')']);
xlabel('x轴');ylabel('y轴')
hold off
figure
Uerror=abs(exp(pi*(t1+t2)).*sin(pi*t1).*sin(pi*t2)-UU');
mesh(t1,t2,Uerror);
title(['五点差分法求解误差(hx=',num2str(hx),';hy=',num2str(hy),')']);
xlabel('x轴');ylabel('y轴')












