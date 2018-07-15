function x = funx( N )
%% 在（0,1）上随机取点，选取不定步长的节点
% 此方法用的是在（0,1）上随机取N-1个数，然后排序作为节点
n = N-1;
x = rand(N-1,1,'double');
for i = 1:n
    for j = 2:n 
        if x(j-1) > x(j)
            b = x(j);
            x(j) = x(j-1);
            x(j-1) = b;
        end
    end
    n = n-1;
end

end

