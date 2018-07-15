clc 
close all
%% Object Function
figure(1);
x=0:0.05:1;
y=exp(-5*x);
plot(x,y)
hold on
h=0.05;
%% Euler Methods
m=zeros(1,21);n=zeros(1,21);
m(1)=1;n(1)=1;k=1;
for i=2:21
    m(i)=(1-5*h)*m(i-1);
    w=zeros(20);
    w(1)=n(i-1); 
    while k>0
        w(k+1)=n(i-1)-5/2*h*(n(i-1)+w(k));
        if (abs(w(k+1)-w(k)))<1e-4
            break;
        end
        k=k+1;
    end
    n(i)=w(k+1);
end
%% Adams Methods
u=zeros(1,21);v=zeros(1,21);
u(1)=1;v(1)=u(1);
for i=2:4
    w=zeros(10000);
    w(1)=u(i-1); 
    while k>0
        w(k+1)=u(i-1)-5/2*h*(u(i-1)+w(k));
        if (abs(w(k+1)-w(k)))<1e-4
            break;
        end
        k=k+1;
    end
    u(i)=w(k+1);
end
v(2)=u(2);v(3)=u(3);
for i=5:21
    u(i)=u(i-1)-5/24*h*(55*u(i-1)-59*u(i-2)+37*u(i-3)-9*u(i-4));
end
for i=4:21
    w=zeros(1,10000);
    while k>0
        w(k+1)=v(i-1)-5/24*h*(9*w(k)+19*v(i-1)-5*v(i-2)+v(i-3));
        if (abs(w(k+1)-w(k)))<1e-4
            break;
        end
        k=k+1;
    end
    v(i)=w(k+1);
end
%% Graphs
t=0:0.05:1;
plot(t,m,'y+-')
hold on
plot(t,n,'ks-')
hold on
plot(t,u,'r*-');
hold on
plot(t,v,'go-');
title('Euler and Adams Methods');
xlabel('t');
ylabel('u');
legend('Object Function','Euler','Upgrade Euler','Adams-Bashorth','Adams-Moulton');
hold off
% Error Comparison
a=abs(y-m);b=abs(y-n);c=abs(y-u);d=abs(y-v);
figure(2);
plot(t,a,'y+')
hold on
plot(t,b,'ks')
hold on
plot(t,c,'r*')
hold on
plot(t,d,'go')
title('Error Comparison   h=0.05')
legend('Euler','Upgrade Euler','Adams-Bashorth','Adams-Moulton');
hold off