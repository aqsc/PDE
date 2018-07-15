%%ʹ��˫����PR����ⷽ����Ax=b
%  L1��L2ΪҪ�����
%  x0�����ʼֵ
%  numstep�����������
%  f������֮��Ӧ�ĵ�ʽ�Ҳຯ��ֵ
%  hx������
%  tao��tao1Ϊ��������

function[x,numstep]=PRtwo(L1,L2,f,x0,hx)
[m,n]=size(L1);
I=eye(m,n);
x=x0;xtemp=x0;
rou=sqrt(2)-1;
a=sin(pi*hx/2)^2;
tao=hx*hx/4/a*((1-rou)/(1+rou));
tao1=hx*hx/4/a*((1-rou)/(1+rou))^3;
flag=0;
numstep=0;
while 1
    if flag==0
        xtemp1=(I+tao*L1)\((I-tao*L2)*xtemp+tao*f);
        x=(I+tao*L2)\((I-tao*L1)*xtemp1+tao*f);
    else
        xtemp1=(I+tao1*L1)\((I-tao1*L2)*xtemp+tao1*f);
        x=(I+tao1*L2)\((I-tao1*L1)*xtemp1+tao1*f);
    end
    numstep=numstep+1;
    if(max(abs(x-xtemp))<1e-4)||numstep>200
        break
    end
    flag=~flag;
    xtemp=x;
end   