xspan=[0,1];%x������
tspan=[0,0.1];%t������
fun=inline('0*x'); %f(x)
fun1=inline('sin(pi*x)');%U(x,0)�ı��ʽ
N=100;
J=10;
a=1;

[u,F,S,I,r,x,T]=initial(a,N,J,xspan,tspan,fun,fun1); %��ʼ��ֵ
r     %����

%%%%%%%%%% ѡ���ַ�ʽ %%%%%%%%%%%%%%%%%%%%%%

U=diff_front(u,F,I,S,r,T,N,J);%��ǰ���
%U=diff_back(u,F,I,S,r,T,N,J);%�����
%U=sixpiont_symmetry(u,F,I,S,r,T,N,J); %����Գ�
%U=Richardson(u,F,I,S,r,T,N,J); %����ɭ��


%%%%%%%%% ��ͼ %%%%%%%%%%%%%%%
y=exp(-(pi^2)*0.1)*sin(pi*x);%t=0.1ʱU������

plot(x,y,'r-',x,U(:,N+1),'g--')
legend('��ȷ��','���ֵ')

 

