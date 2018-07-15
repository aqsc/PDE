function   [u,x]=bodong(a,h,T,xspan,tspan,fun1,fun2)%�������̵Ĳ�����

J=(xspan(2)-xspan(1))/h;%x��ڵ���
N=(tspan(2)-tspan(1))/T;%t��ڵ���
r=a*T/h;%����
u=zeros(J+1,N+1);

%%%��ڵ�x��ֵ��u(x,0)=F1(x),u_t(x,0)=F2(x)����ֵ
F1=zeros(J+1,1);
F2=zeros(J+1,1);
for i=1:J+1
    x(i)=xspan(1)+(i-1)*h;
    F1(i)=feval(fun1,x(i));
    F2(i)=feval(fun2,x(i));
end


%%%%�г�ʼ�����ɵ�
u(:,1)=F1;
%%%������u(:,2)��ֵ
for j=2:J
    u(j,2)=(r^2/2)*(F1(j-1)+F1(j+1))+(1-r^2)*F1(j)+T*F2(j);
end

%%%%%%%%���Ͽ�֪U��1,2��������������������ָ�ʽ��ʣ���
for n=2:N
    for j=2:J
        u(j,n+1)=r^2*(u(j-1,n)+u(j+1,n))+2*(1-r^2)*u(j,n)-u(j,n-1);
    end
end
u;

