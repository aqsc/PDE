fun1=inline('2*sin(pi*x)');
fun2=inline('0*x');
xspan=[0,1];%x的范围
tspan=[0,2];%t的范围
a=1;
f=inline('sin(pi*(x-t))+sin(pi*(x+t))');%精确解
%%%%%%%%%%%%选择不同的h,T%%%%%%%%%%%
T=0.05;h=0.1;
%T=0.1;h=0.1;
%%%%%%%%%%%%%%%%%%%%%%%%



[u,x]=bodong(a,h,T,xspan,tspan,fun1,fun2);
 s1=feval(f,0.5,x);%t=0.5精确解
 s2=feval(f,1.0,x);%t=1.0精确解
 s3=feval(f,1.5,x);%t=1.5精确解
 s4=feval(f,2.0,x);%t=2.0精确解
 
 
 
subplot(2,2,1) 
plot(x,s1,'g*',x,u(:,0.5/T+1),'r--')  
legend('精确解','拟合值')
 title('t=0.5')
 
subplot(2,2,2) 
plot(x,s2,'g*',x,u(:,1.0/T+1),'r--')  
legend('精确解','拟合值')
title('t=1.0')

subplot(2,2,3) 
plot(x,s3,'g*',x,u(:,1.5/T+1),'r--')  
legend('精确解','拟合值')
title('t=1.5')

subplot(2,2,4) 
plot(x,s4,'g*',x,u(:,2.0/T+1),'r--')  
legend('精确解','拟合值')
title('t=2.0')

