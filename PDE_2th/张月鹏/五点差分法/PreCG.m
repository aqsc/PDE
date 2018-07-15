%%ʹ��Ԥ�������ݶȷ���ⷽ����Ax=b
%  x0�����ʼֵ
%  numstep�����������
%  B����Ԥ����ľ���


function[x,numstep]=PreCG(A,b,x0)
n=length(b);
B=zeros(n,n);
for i=1:n
    B(i,i)=A(i,i);
end
for i=1:n-1
    B(i,i+1)=A(i,i+1);
    B(i+1,i)=A(i+1,i);
end
B=inv(B);
A=B*A;
b=B*b;
x=x0;xtemp=x0;
r=b-A*x;
p=r;
for i=1:n
    a=r'*r/(p'*A*p);
    x=x+a*p;
    rr=r-a*A*p;
    if(max(abs(x-xtemp))<1e-4)
        break;
    end
    xtemp=x;
    b=rr'*rr/(r'*r);
    p=rr+b*p;
    r=rr;
end
numstep=i;