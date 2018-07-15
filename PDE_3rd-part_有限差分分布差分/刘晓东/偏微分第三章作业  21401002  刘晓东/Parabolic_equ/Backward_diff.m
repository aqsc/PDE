function [ u ] = Backward_diff( J, N, h, tao, r )
%% ����ָ�ʽ

% ��ʼ�� u, v1, f
u = zeros(J+1, N+1);
v1 = zeros(J-1,1);
f = zeros(J-1,1);

% ����ָ�ʽ��ϵ������A
A = coefficient_matA(1+2*r, -r, -r, J);

% ����v1,f
for j = 1:J-1
    v1(j) = fi(j*h);
    f(j) = funf(j*h);
end

% ����õ����� u Ϊ����ָ�ʽ��õĽ�
u(2:J,1) = v1;
for n = 2:N+1
    v1 = A \ ( v1 + tao * f);
    u(2:J,n) = v1;
end

end