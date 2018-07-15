%%direct difference method

function u=difference(a,b,c,d,n)
x=zeros(n+1,1);
x(1)=a;x(n+1)=b;
x(2:n)=sort(rand(n-1,1)*(b-a));
h=zeros(n,1);
for i=1:n
    h(i)=x(i+1)-x(i);
end
u=zeros(n+1,1);
u(1)=c;u(n+1)=d;
A=zeros(n-1,n-1);                               %Coefficient matrix
F=zeros(n-1,1);                                                       
for i=1:n-1
    A(i,i)=2*p((x(i+1)+x(i+2))/2)/((h(i)+h(i+1))*h(i+1))+2*p((x(i)+x(i+1))/2)/((h(i)+h(i+1))*h(i))+q(x(i+1));
    F(i)=f(x(i+1));
end
F(1)=F(1)-(2*p((x(1)+x(2))/2)/((h(1)+h(2))*h(1))-r(x(1))/(h(1)+h(2)))*c;
F(n-1)=F(n-1)-(2*p((x(n)+x(n+1))/2)/((h(n-1)+h(n))*h(n))+r(x(n+1))/(h(n-1)+h(n)))*d;
for i=1:n-2
    A(i,i+1)=-2*p((x(i+1)+x(i+2))/2)/((h(i)+h(i+1))*h(i+1))+r(x(i+1))/(h(i)+h(i+1));
    A(i+1,i)=-2*p((x(i+1)+x(i+2))/2)/((h(i+1)+h(i+2))*h(i+1))-r(x(i+2))/(h(i+1)+h(i+2));
end
u(2:n)=A\F;
y=1/4-(x-1/2).^2;
figure(1)
plot(x,y);
hold on
plot(x,u,'r*-');
title('Direct difference method')
legend('Object Function','Direct difference')
z=abs(y-u);
figure(2)
plot(x,z,'b*-')
title('Error')
