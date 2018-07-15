function [ u ] = reshapeu( v,h,k )
%% function reshapeu get the matrix u with input vector v

n = 1/h;
m = 1/k;
u = zeros(n,m);
for j = 0:m
    for i = 0:n
        if (i == 0 || i == n || j == 0 || j == m)
            u(i+1,j+1) = 0;
        else
            u(i+1,j+1) = v((j-1)*(n-1) +i);
        end
    end
end
end