function [u,x]=upwind_y(fun,a,h,T,xspan,tspan)
J=(xspan(2)-xspan(1))/h;
N=(tspan(2)-xspan(1))/T;
u=zeros(J+1,N+1);
u(1,:)=ones(1,N+1);
r=a*T/h;
for i=1:J+1
    x(i)=xspan(1)+(i-1)*h;
    u(i,1)=feval(fun,x(i));
end

A=zeros(J,J);
for j=1:J-1
    A(j,j)=1+r;
    A(j+1,j)=-r;
end
A(J,J)=1+r;

for n=1:N
    u(2,n)=r*u(1,n)+u(2,n);
    b=u(2:J+1,n);
    q=sanduijiao(A,b);
    u(2:J+1,n+1)=q';
end
u;