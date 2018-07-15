function [ A,F,u ] = five_spot( h,k )
%% Get the five-points difference equation
% h,k is the step of x-axis and y-axis

n = 1/h -1;
m = 1/k -1;
u = rand(m*n, 1);
F = zeros(m*n, 1);
n=63;
m=63;
h = 1/64;
k = 1/64;
temp1 = diag(-1*ones(n-1,1),1) + diag(-1*ones(n-1,1),-1) + diag(2*ones(n,1));
Ax = temp1./h^2;
temp2 = diag(-1*ones(n-1,1),1) + diag(-1*ones(n-1,1),-1) + diag(2*ones(n,1));
Ay = temp2./k^2;
A = kron(eye(m,m), Ax) + kron(Ay, eye(n,n));

for j=1:m
    for i=1:n
        F((j-1)*n +i) = funf(i*h,j*k);
    end
end

end