function [ u ] = Crank_Nicolson( J, N, h, tao, r )
%% ����ԳƸ�ʽ

% ��ʼ�� u, v1, f
u = zeros( J+1, N+1 );
v1 = zeros( J-1, 1 );
f = zeros( J-1, 1 );

% ����ԳƸ�ʽ��ϵ������A1, A2
A1 = coefficient_matA( 1+r, -r/2, -r/2, J );
A2 = coefficient_matA( 1-r, r/2, r/2, J );

% ���� v1, f
for j = 1:J-1
    v1( j ) = fi( j * h );
    f(j) = funf( j*h );
end

% ����õ����� u Ϊ����ԳƸ�ʽ��õĽ�
u(2:J, 1) = v1;
for n = 2:N+1
    v1 = A1 \ (A2 * v1 + tao * f);
    u( 2:J, n ) = v1;
end

end