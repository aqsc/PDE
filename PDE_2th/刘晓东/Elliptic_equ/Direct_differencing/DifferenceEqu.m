function [x,V] = DifferenceEqu( N , a , b, u0, uN)
%% ��ֱ�Ӳ�ֻ��ķ������һά��ָ�ʽ����ͨ��AU = F�����U

% ����ڵ�����,��funx()
x = zeros(N+1,1);
xx = funx(N);
x(1) = a;
x(N+1) = b;
for i = 2:N
    x(i) = xx(i-1);
end

% ���㲻������
h = zeros(N,1);
for i = 1:N
    h(i) = x(i+1) - x(i);
end

% ����p(i-1/2),��Ϊp(i),��funp()
p = zeros(N, 1);
for i = 1:N
    p(i) = funp(x(i+1) - h(i)/2);
end

% ����p(i-1/2��/h(i),��ʽΪ��ָ�ʽ�е�һ�����ʽ
ph = zeros(N,1);
for i = 1:N
    ph(i) = p(i) / h(i);
end

% ����1/(h(i) + h(i+1))����ʽΪ��ָ�ʽ�е�һ�����ʽ
hh = zeros(N-1,1);
for i = 1:N-1
    hh(i) = 1 / (h(i) + h(i+1));
end

% �������A������һ�ײ�ָ�ʽ��AΪ���ԽǾ���
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

% �������F
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

% �����U
V = zeros(N+1,1);
U = A\F;
V(1) = u0;
V(N+1) = uN;
for i = 2:N
    V(i) = U(i-1);
end
    
end

