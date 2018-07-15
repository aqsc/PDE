function Y = finite_element(left_boundary, right_boundary, ...
                            space_step, ...
                            func_p, func_q, func_f, ...
                            initial_value, boundary_value)

N = (right_boundary - left_boundary) / space_step;
X = left_boundary:space_step:right_boundary;

A = zeros(N, N);
b = zeros(N, 1);

syms x;
for i = 1:N
    if (i-1) > 0
        A(i-1, i) = vpa(int(-1/space_step*func_p(x) + space_step*func_q(x)*x*(1-x), 'x', 0, 1));
    end
    if (i+1) <= N
        A(i+1,i) = vpa(int(-1/space_step*func_p(x) + space_step*func_q(x)*x*(1-x), 'x', 0, 1));
    end
    A(i,i) = vpa(int( 1/space_step*func_p(x) + space_step*func_q(x)*x*x, 'x', 0, 1)) + ...
               vpa(int( 1/space_step*func_p(x) + space_step*func_q(x)*(1-x)*(1-x), 'x', 0, 1));
    b(i) = space_step * vpa(int(func_f(X(i)+space_step*x)*x, 'x', 0, 1)) + ...
           space_step * vpa(int(func_f(X(i+1)+space_step*x)*(1-x), 'x', 0, 1));
end

Y = inv(A) * b;

%% º¯Êý½áÊø
end