clc
close all
x=0:0.05:1;
y=exp(-5*x);
figure(1);
plot(x,y)
hold on
h=0.05;
u=zeros(1,21);v=zeros(1,21);
u(1)=1;v(1)=1;k=1;
for i=2:21
    u(i)=(1-5*h)*u(i-1);
    w=zeros(20);
    w(1)=v(i-1); 
    while k>0
        w(k+1)=v(i-1)-5/2*h*(v(i-1)+w(k));
        if (abs(w(k+1)-w(k)))<1e-4
            break;
        end
        k=k+1;
    end
    v(i)=w(k+1);
end
t=0:0.05:1;
plot(t,u,'r*-')
hold on
plot(t,v,'go-')
xlabel('t')
ylabel('u')
title('Euler Method   h=0.05')
legend('Object Function','Euler','Upgrade Euler')
hold off
a=abs(y-u);b=abs(y-v);
figure(2)
plot(t,a,'r*')
hold on
plot(t,b,'go')
title('Error Comparison   h=0.05')
legend('Euler','Upgrade Euler');
hold off