function u = Lax_Wendroff( a, h, tao, T, max_X )

N = T / tao;
M = max_X / h;
r = a * tao / h;
u0 = zeros(M+N+1, 1);

for i = 1:M+N+1
    u0(i) = funf((i-1) * h);
end

for i = 1:N
    matA = coefficient_matA((r+r^2)/2, 1-r^2, (r^2 - r)/2, M+N-i, 2);
    u = zeros(M+N+1-i,1);
    u(2:M+N+1-i) = matA * u0;
    u(1) = u0(1);
    u0 = zeros(M+N+1-i,1);
    u0 = u;
end


end

