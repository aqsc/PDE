function u = Lax_Wendroff(a,tau,h)
%LAX_WENDROFF �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

global x x_final T
N = T/tau;
M = x_final/h;
u = zeros(1,M+1);
r = a*tau/h;
           
% �����ʼ��u
for j = 1:M+1
    u(j) = abs(x(j)-1);
end
% ������е���
u0 = zeros(1,M+1);
% f = a*u ���������������aΪ����ʱ��ʽ�Ӽ�
for i = 1:N
    u0(1) = 1;
    for j = 2:M
        u0(j) = u(j) - 1/2*r*(u(j+1) - u(j-1)) + 1/2*r^2*(u(j+1)-2*u(j) + u(j-1));
    end   
    u0(M+1) = u(M+1) - 1/2*r*(u(M+1)+h - u(j-1)) + 1/2*r^2*(u(M+1)+h-2*u(M) + u(M-1));
    u = u0;
end


end

