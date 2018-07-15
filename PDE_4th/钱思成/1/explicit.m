function u = explicit(tau,h,t_final)
% �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
a = 1;
% t_final = 1.0;   % 0.5 1.5 2.0
% tau = 0.05;      % t  �Ჽ��
% h = 0.1;         % x  �Ჽ��
N = t_final/tau;   % t  �����  
X = 1/h;           % x  �����
% t = 0:tau:t_final;
x = 0:h:1;
r = a*tau/h;
u0 = 2*sin(pi*x);
u1 = u0 + tau*0;
u = zeros(X+1,1);
for t = 1:N-1
    for j = 2:X
        u(j) = r^2*(u1(j-1) + u1(j+1)) + 2*(1-r^2)*u1(j) - u0(j);
    end
    u0 = u1;
    u1 = u;
end 
u
% plot(x,u)

% end

