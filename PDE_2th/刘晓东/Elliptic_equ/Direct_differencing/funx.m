function x = funx( N )
%% �ڣ�0,1�������ȡ�㣬ѡȡ���������Ľڵ�
% �˷����õ����ڣ�0,1�������ȡN-1������Ȼ��������Ϊ�ڵ�
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

