function u = ADI(t_final,tau,h)
%% @ written by Qian SiCHENG 
%% @ NO:21401019
%% @ �����������������ͷ���
r = tau/h^2;      %  ����
M = 1/h;        %  x�������y�����
N = t_final/tau;   %  ʱ�����
x = 0:h:1;
y = 0:h:1;
%******************************************************************
%��ʼ����
a = -r/2*ones(1,M-2);
b = (1+r)*ones(1,M-1);
A = diag(b,0) + diag(a,-1) + diag(a,1);
aa = r/2*ones(1,M-2);
bb = (1-r)*ones(1,M-1);
B = diag(bb,0) + diag(aa,-1) + diag(aa,1);

%% �����Ҷ˷���������
F=zeros(M-1,M-1,N);
for n=1:N
    for j=1:M-1
        for k=1:M-1
            F(j,k,n)=tau*f(x(j+1),y(k+1),(n-1+1/2)*tau);
        end
    end
end
v = zeros(M+1);
w = zeros(M+1);
%% �������
for n=1:N
    %��u(n+1/2)
    for k=2:M
        w(2:M,k)=A\(v(2:M,k-1:k+1)*B(1:3,2)+F(:,k-1,n)/2);  
    end
    %��u(n+1)
    for j=2:M
        v(j,2:M)=(B(2,1:3)*w(j-1:j+1,2:M)+F(j-1,:,n)/2)/A;  
    end
end
u=v';



