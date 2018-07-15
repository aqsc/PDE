clc
clear
l=1;
T=0.1;
J=40;
N=320;
a=1;
h=l/J;
tau=T/N;
u=zeros(N+1,J+1);
x=0:h:l;
t=0:tau:T;

for n=1:N+1
    for j=1:J+1
        u(n,j)=exact(x(j),t(n));
    end
end
figure(1)
mesh(x,t,u)
title('Exact solution')

v=forward(l,T,J,N,a);
figure(2)
mesh(x,t,v)
title('Forward difference')
e=abs(u-v);
figure(3)
mesh(x,t,e)
title('Forward difference error')

w=backward(l,T,J,N,a);
figure(4)
mesh(x,t,w)
title('Backward difference')
e=abs(u-w);
figure(5)
mesh(x,t,e)
title('Backward difference error')

y=CrankNicolson(l,T,J,N,a);
figure(6)
mesh(x,t,y)
title('CrankNicolson difference')
e=abs(u-y);
figure(7)
mesh(x,t,e)
title('CrankNicolson difference error')

z=forward(l,T,J,N,a);
figure(8)
mesh(x,t,z)
title('Richardson difference')
e=abs(u-z);
figure(9)
mesh(x,t,e)
title('Richardson difference error')