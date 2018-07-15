function u = Box_Scheme( a, h, tao, T, max_X )

N = T / tao;
M = max_X / h;
r = a * tao / h;
r1 = (1-r)/(1+r);
u0 = zeros(M+1, 1);
u = zeros(M+1, 1);

for i = 1:M+1
    u0(i) = funf((i-1) * h);
end

for i = 1:N
    u(1) = 1;
    for j = 2:M+1
        u(j) = u0(j-1) + r1 * u0(j) - r1 * u(j-1);
    end
    u0 = u;
end
end