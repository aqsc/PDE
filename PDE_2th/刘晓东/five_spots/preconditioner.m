function [ B ] = preconditioner( A )
%% The preconditioner of matrix A
[m,n] = size(A);
B = zeros(m,n);
for i=1:m
    for j=1:n
        if j == i || abs(j-i) == 1
            B(i,j) = A(i,j);
        end
    end
end
end

