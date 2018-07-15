%%Runge-Kutta method
function u=RungeKutta(h)
m=2/h+1;
u=zeros(1,m);
u(1)=1;
for n=1:m-1
    t=h*(n-1);
    k1=4*t*sqrt(u(n));
    k2=4*(t+0.5*h)*sqrt(u(n)+0.5*h*k1);
    k3=4*(t+0.5*h)*sqrt(u(n)+0.5*h*k2);
    k4=4*(t+h)*sqrt(u(n)+h*k3);
    u(n+1)=u(n)+h/6*(k1+2*k2+2*k3+k4);
end
end