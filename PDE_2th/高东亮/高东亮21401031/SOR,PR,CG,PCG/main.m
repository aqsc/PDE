clc
clear
close all
a=0;b=1;      
c=0;d=1;
h=1/64;
x=a:h:b;
y=c:h:d;
p=2;

figure(1)
u=Exact(a,b,c,d,h);
mesh(x,y,u);
title('Exact Solution');

% [u,k]=Jacobi(a,b,c,d,h);
% sprintf('The Jacobi iterations is %d.',k)
% figure(2)
% mesh(x,y,u);
% title('Jacobi Iteration');

% figure(3)
% [z,m]=GaussSeidel(a,b,c,d,h);
% mesh(x,y,z);
% title('Gauss-Seidel Iteration')
% sprintf('The Gauss-Seidel iterations is %d.',m)


figure(2)
[v,m]=SOR(a,b,c,d,h);
mesh(x,y,v)
title('SOR Iteration');
sprintf('The SOR iterations is %d.',m)
e=abs(u-v);
figure(3)
mesh(x,y,e)
title('SOR Iteration Error')

% PR(one parameter) method will run a long time 
%(when h=1/64, it runs about five minutes on a Lenovo ThinkStation )
figure(4)
[w,n]=PR1(a,b,h);
sprintf('The PR iterations (one parameter) is %d.',n)
mesh(x,y,w)
title('PR Iteration (one parameter)')
e=abs(u-w);
figure(5)
mesh(x,y,e)
title('PR Iteration Error (one parameter)')

figure(6)
[w,n]=PR2(a,b,h,p);
sprintf('The PR iterations (two parameters) is %d.',n)
mesh(x,y,w)
title('PR Iteration (two parameters)')
e=abs(u-w);
figure(7)
mesh(x,y,e)
title('PR Iteration Error (two parameters)')

figure(8)
[g,k]=CGM(a,b,c,d,h);
sprintf('The CG iterations is %d.',k)
mesh(x,y,g)
title('CG Iteration')
e=abs(u-g);
figure(9)
mesh(x,y,e)
title('CG Iteration Error')

figure(10)
[z,l]=PCG(a,b,c,d,h);
sprintf('The PCG iterations is %d.',l)
mesh(x,y,z)
title('PCG Iteration')
e=abs(u-z);
figure(11)
mesh(x,y,e)
title('PCG Iteration Error')



