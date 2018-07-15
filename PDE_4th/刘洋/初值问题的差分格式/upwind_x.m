function [u,x]=upwind_x(fun,a,h,T,xspan,tspan)
J=(xspan(2)-xspan(1))/h;
N=(tspan(2)-xspan(1))/T;
u=zeros(J+1,N+1);
u(1,:)=ones(1,N+1);
r=a*T/h;
for i=1:J+1
    x(i)=xspan(1)+(i-1)*h;
    u(i,1)=feval(fun,x(i));
end

for n=1:N
    for j=2:J+1
        u(j,n+1)=(1-r)*u(j,n)+r*u(j-1,n);
    end
end
u;