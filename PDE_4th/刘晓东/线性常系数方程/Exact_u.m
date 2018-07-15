function u = Exact_u(  h, T, max_X )
%% ¾«È·½â

M = max_X / h;
u = zeros(M+1,1);

for i = 1:M+1
    x = (i-1) * h;
    if x - T < 0
        u(i) = 1;
    elseif x- T >1
        u(i) = (x - T) - 1;
    else
        u(i) = 1 - (x - T);
    end
end

end

