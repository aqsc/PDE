function [ u ] = SOR( h,k )
%% The SOR-method of the five-points difference equation
% a1,a2,a3,a4,a5 are the parameters of the method
% mu is the max eigenvalue
% w is the optimum relaxation parameter
tic
m = 1/h;
n = 1/k;
a1 = 2/h^2 + 2/k^2;
a2 = 1/h^2;
a3 = 1/k^2;
a4 = a2;
a5 = a4;

mu = cos(pi*h);
w = 2/(1+sqrt(1-mu^2));

iter = 1;
u = zeros(m+1,n+1);
f = zeros(m+1,n+1);
for i=1:m+1
    for j=1:n+1
        f(i,j) = funf((i-1)*h,(j-1)*k);
    end
end
while 1
    for i=2:m
        for j=2:n
            v = u;
            u(i,j) = v(i,j) - w/a1 *(a1*v(i,j) - a2*v(i-1,j) - a3*v(i,j-1) - a4*v(i+1,j) - a5*v(i,j+1) - f(i,j));
        end
    end
    if max(max(abs(u-v))) < 1e-8
        break;
    end
    iter = iter+1;
end
disp('SOR_method')
disp(['iteration',num2str(iter)])
toc

end

