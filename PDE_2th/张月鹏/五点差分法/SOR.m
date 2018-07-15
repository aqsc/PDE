%%ʹ��SOR���������־�������
%  x0�����ʼֵ
%  numstep�����������
%  F������֮��Ӧ�ĵ�ʽ�Ҳຯ��ֵ
%  hx������
%  omigaΪ�ɳ�����

function[x,numstep]=SOR(F,x0,hx)
[m,n]=size(F);
a11=2/hx/hx+2/hx/hx;
a01=1/hx/hx;a21=a01;
a10=1/hx/hx;a12=a10;
x=x0;xtemp=x0;
mu=cos(pi*hx);
omiga=2/(1+sqrt(1-mu^2));
numstep=0;
while 1
    for i=2:m-1
        for j=2:n-1
            x(i,j)=x(i,j)-omiga/a11*(a11*x(i,j)-a01*x(i-1,j)-a10*x(i,j-1)-a21*x(i+1,j)-a12*x(i,j+1)-F(i,j));
        end
    end
    numstep=numstep+1;
    if(max(max(abs(x-xtemp)))<1e-4)
        break
    end
    xtemp=x;
end    