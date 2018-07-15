function u = explicit_y(a,tau,h )
%EXPLICIT_Y �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%% ����ʽӭ��
global x T x_final
r = a*tau/h;
N = T/tau;
M = x_final/h;
u = zeros(1,M+1);
% �����ʼ��u
for j = 1:M+1
    u(j) = abs(x(j)-1);
end
% ������е���
u0 = zeros(1,M+1);
for i = 1:N
    u0(1) = 1;
    for j = 2:M+1
        u0(j) = (u(j) + r*u0(j-1))/(1+r);
    end   
    u = u0;
end


end

