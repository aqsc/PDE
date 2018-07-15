clc
close all
h=0.01;                      %Step length
a=0;
b=1;
c=1;                         %u(a)
d=exp(1);                    %u(b)
u=difference(a,b,c,d,h);
t=a:h:b;
plot(t,u)
title('Difference Method')