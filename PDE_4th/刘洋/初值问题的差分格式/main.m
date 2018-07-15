fun=inline('sqrt((x-1)^2)');
a=1;
%%%%%%%%%%%%%ѡ����Ӧ�� h T  %%%%%%%%%%%%%%%%%%%
h=0.5;T=0.5;
%h=0.5;T=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xspan=[0,5];
tspan=[0,5];
J=5/h;
%%%%%%%%%%%%%%%%%%%%ѡ����Ӧ�ķ���%%%%%%%%%%%%%
[u,x]=upwind_x(fun,a,h,T,xspan,tspan);%��ʽӭ���ʽ
%[u,x]=upwind_y(fun,a,h,T,xspan,tspan);%��ʽӭ���ʽ
%[u,x]=Lax_Friedrichs(fun,a,h,T,xspan,tspan);%Lax_Friedrichs��ʽ
%[u,x]=Box_Scheme(fun,a,h,T,xspan,tspan);%Box_Scheme��ʽ
%[u,x]=Lax_Wendroff(fun,a,h,T,xspan,tspan);%Lax_Wendroff��ʽ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[u1,u2,u3,u4,u5]=f_exact(h);
u_1=u(:,1/T+1);
u_2=u(:,2/T+1);
u_3=u(:,3/T+1);
u_4=u(:,4/T+1);
u_5=u(:,5/T+1);

subplot(1,5,1) 
plot(x,u1,'g*',x,u_1,'r--')  
legend('��ȷ��','���ֵ')
 title('t=1')
 
subplot(1,5,2) 
plot(x,u2,'g*',x,u_2,'r--')  
legend('��ȷ��','���ֵ')
title('t=2')

subplot(1,5,3) 
plot(x,u3,'g*',x,u_3,'r--')  
legend('��ȷ��','���ֵ')
title('t=3')

subplot(1,5,4) 
plot(x,u4,'g*',x,u_4,'r--')  
legend('��ȷ��','���ֵ')
title('t=4')

subplot(1,5,5) 
plot(x,u5,'g*',x,u_5,'r--')  
legend('��ȷ��','���ֵ')
title('t=5')


