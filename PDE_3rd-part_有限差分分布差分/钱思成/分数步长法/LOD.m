function u = LOD(t_final,tau,h)                                                                                   
%LOD �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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
u = zeros(M+1);

for n = 1:N
    for k = 2:M
        F = zeros(M-1,1);
        for j = 2:M
            F(j-1) = f(x(j),y(k),(n+1/2)*tau);
        end  
        u(2:M,k) = A\(B*u(2:M,k) + tau*F);
    end
    for j = 2:M
        for k = 2:M
            F(j-1) = f(x(j),y(k),(n+1/2)*tau);
        end
        g = u(j,2:M);
        g = g';
        u(j,2:M) = A\(B*g + tau*F);
    end               
end
u = u';


end




