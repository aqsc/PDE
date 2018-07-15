function [ u ] = explicit_scheme( a, t, h, tao, temp )
%% ��ַ����Ը�ʽ����
% ������ز���
J = 1 / h;
N = t / tao;
r = a * tao / h;

% ��ʼ�������u
u = zeros(J+1, 1);

% ϵ������MatA
MatA = coefficient_matA(2*(1-r^2), r^2, r^2, J);

% ��ʼ���� u0 u1, ��ȥ���˵㣬�����м�N-1����
x = h:h:1-h;
u0 = fi0(x');

% tempΪ�����ʼ����u1�ķ���
% normal_diffΪһ��Ĳ�ַ��̣�central_diffΪ���Ĳ���
switch temp
    case 'normal_diff'
        u1 = u0 + tao * fi1(x');
    case 'central_diff'
        u1 = 0.5 * MatA * u0 + tao * fi1(x');
end

% ���ó�ʼ�������
for n = 3:N+1
    u2 = MatA * u1 - u0;
    u0 = u1;
    u1 = u2;
end
u(2:J) = u2;

end

