clear;clc;close all;
%%h=0.1
t=0:0.001:1;
u=exp(-5*t);
h=0.1;
tt=0:h:1;
T=1/h;
%%��ʽŷ����
u11(1)=1;
for i=1:T
  u11(i+1)=u11(i)+h*-5*u11(i);
end
%%��ʽŷ����
u21(1)=1;
for i=1:T
  u21(i+1)=u21(i)/(h*5+1);
end
%%�Ľ�ŷ����
u31(1)=1;
for i=1:T
    u31(i+1)=u31(i)*(-5*h+2)/(5*h+2);
end
hold on;
plot(t,u);
plot(tt,u11,'or');
plot(tt,u21,'oc');
plot(tt,u31,'om');
legend('ԭͼ��','��ʽŷ����','��ʽŷ����','�Ľ�ŷ����')
title('ŷ����(h=0.1)')
xlabel('x��');ylabel('y��')
hold off

%%h=0.05
figure
h=0.05;
tt=0:h:1;
T=1/h;
%%��ʽŷ����
u1(1)=1;
for i=1:T
  u1(i+1)=u1(i)+h*-5*u1(i);
end
%%��ʽŷ����
u2(1)=1;
for i=1:T
  u2(i+1)=u2(i)/(h*5+1);
end
%%�Ľ�ŷ����
u3(1)=1;
for i=1:T
  u3(i+1)=u3(i)*(-5*h+2)/(5*h+2);
end
hold on;
plot(t,u);
plot(tt,u1,'or');
plot(tt,u2,'oc');
plot(tt,u3,'om');
legend('ԭͼ��','��ʽŷ����','��ʽŷ����','�Ľ�ŷ����')
title('ŷ����(h=0.05)')
xlabel('x��');ylabel('y��')
hold off;



