clc 
clear
close all
a=0;
b=1;
h=0.01;
x=a:h:b;
y=exact(x);
u=Galerkin(a,b,h);
w=Ritz(a,b,h);
plot(x,y,x,u,x,w);
title(['Linear element: h=', num2str(h)])
legend('ExactSolution','Galerkin','Ritz','Location','northwest');
figure
v=abs(y'-u);
e=abs(y'-w);
plot(x,v,x,e)
title(['Error: h=',num2str(h)])
legend('Galerkin','Ritz','Location','northwest');
