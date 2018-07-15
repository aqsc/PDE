function  [u,F,S,I,r,x,T]=initial(a,N,J,xspan,tspan,fun,fun1)

%a ��ʾ���׵�ǰ��ϵ��,r��ʾ����
%N,J�ֱ��ʾx,t�Ľڵ���
%xspan,tspan,ָ��x,t������
%fun��ʾf(x)
%fun1��ʾu(x,0)
%u��ʾ�����ֵ��F=[f(1),....,f(J-1)]';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% ��ʼ�� u, F %%%%%%%%%%%%
u=zeros(J+1,N+1);
F=zeros(J+1,1);

h=(xspan(2)-xspan(1))/J;
T=(tspan(2)-tspan(1))/N;
r=a*T/(h*h);  %����

%������F�Լ�U(:,1)
for i=1:J+1
    x(i)=xspan(1)+(i-1)*h;
    F(i)=feval(fun,x(i));
    u(i,1)=feval(fun1,x(i));
end

%%%��ʼ��S �� I %%%%%%%%
I=eye(J-1);
S=zeros(J-1,J-1);

 for i=1:J-2
  S(i,i+1)=1;
  S(i+1,i)=1;
 end
 
 




