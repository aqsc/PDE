%%使用共轭梯度法求解方程组Ax=b
%  x0代表初始值
%  numstep代表迭代步数

function[x,numstep]=CG(A,b,x0)
n=length(b);
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