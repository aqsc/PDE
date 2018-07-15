function [ u ] = Richardson( l, J, N, a, h, tao, r )
%% Richardson 格式

% 初始化 u, v1, f
u = zeros(J+1, N+1);
v1 = zeros( J-1, 1 );
f = zeros( J-1, 1);

% Richardson 格式的系数矩阵 A
A = coefficient_matA( -4*r, 2*r, 2*r, J );

% 用六点对称格式计算求解 v2, 即为 u(j,2)
[h1, tao1, r1] = taohr(l, tao, J, N, a);
v = Crank_Nicolson(J, N, h1, tao1, r1);
v2 = v(2:J,N+1);

% 计算v1, f
for j = 1:J-1
    v1( j ) = fi( j * h );
    f( j ) = funf( j * h ); 
end

% 计算得到矩阵 u 为 Richardson 格式求得的解
u(2:J,1) = v1;
u(2:J,2) = v2;
for n = 3:N+1
    v3 = A * v2 + v1 + 2 * tao * f;
    u(2:J,n) = v3;
    v1 = v2;
    v2 = v3;
end

end