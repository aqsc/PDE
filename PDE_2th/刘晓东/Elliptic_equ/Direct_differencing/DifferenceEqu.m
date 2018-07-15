function [x,V] = DifferenceEqu( N , a , b, u0, uN)
%% 用直接差分化的方法求解一维差分格式，再通过AU = F计算解U

% 计算节点坐标,用funx()
x = zeros(N+1,1);
xx = funx(N);
x(1) = a;
x(N+1) = b;
for i = 2:N
    x(i) = xx(i-1);
end

% 计算不定步长
h = zeros(N,1);
for i = 1:N
    h(i) = x(i+1) - x(i);
end

% 计算p(i-1/2),设为p(i),用funp()
p = zeros(N, 1);
for i = 1:N
    p(i) = funp(x(i+1) - h(i)/2);
end

% 计算p(i-1/2）/h(i),该式为差分格式中的一个表达式
ph = zeros(N,1);
for i = 1:N
    ph(i) = p(i) / h(i);
end

% 计算1/(h(i) + h(i+1))，该式为差分格式中的一个表达式
hh = zeros(N-1,1);
for i = 1:N-1
    hh(i) = 1 / (h(i) + h(i+1));
end

% 计算矩阵A，利用一阶差分格式，A为三对角矩阵
A = zeros(N-1,1);
for i = 1:N-1
    for j = 1:N-1
        if j == i
            A(i,j) = -2 * hh(i) * (-ph(i+1) - ph(i)) + funq(xx(i));
        elseif j == i+1
            A(i,j) = -2 * hh(i) * ph(i+1) + funr(xx(i)) * hh(i);
        elseif j == i-1
            A(i,j) = -hh(i) * (2 * ph(i) + funr(xx(i)));
        end
    end
end

% 计算矩阵F
F = zeros(N-1,1);
syms t
fun = func(t);
for i = 1:N-1
    t = xx(i);
    F(i) = subs(fun);
    if i == 1
        F(i) = F(i) + (2 * hh(i) * ph(i) + funr(xx(i)) * hh(i)) * u0;
    elseif i == N-1
        F(i) = F(i) + (2 * hh(i) * ph(i+1) - funr(xx(i)) * hh(i)) * uN;
    end
end

% 计算解U
V = zeros(N+1,1);
U = A\F;
V(1) = u0;
V(N+1) = uN;
for i = 2:N
    V(i) = U(i-1);
end
    
end

