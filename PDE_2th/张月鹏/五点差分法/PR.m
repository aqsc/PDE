%%ʹ�õ�����PR����ⷽ����Ax=b
%  L1��L2ΪҪ�����
%  x0�����ʼֵ
%  numstep�����������
%  f������֮��Ӧ�ĵ�ʽ�Ҳຯ��ֵ
%  hx������
%  taoΪ��������

function[x,numstep]=PR(L1,L2,f,x0,hx)
[m,n]=size(L1);
I=eye(m,n);
x=x0;xtemp=x0;
tao=0.5*hx*hx/sin(pi*hx);
numstep=0;
while 1
    xtemp1=(I+tao*L1)\((I-tao*L2)*xtemp+tao*f);
    x=(I+tao*L2)\((I-tao*L1)*xtemp1+tao*f);
    numstep=numstep+1;
    if(max(abs(x-xtemp))<1e-4)
        break
    end
    xtemp=x;
end   