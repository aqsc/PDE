
function X=trian(S,B)
%TRIAN Summary of this function goes here
%   Detailed explanation goes here
%   追赶法求解三对角阵为系数的方程组
%Input- 三对角矩阵S
%     - B is the constant vector of the linear system
%-------------------------
%     - A is the subdiagonal of the coefficient matrix
%     - D is the main diagonal of the coefficient matrix
%     - C is the superdiagonal of the coefficient matrix 

%-------------------------
%Output - X is the solution vector
%% 构造A -Vector  C -Vector  D -Vector
n = size(S,1);
A = zeros(1,n-1);
C = zeros(1,n-1);
D = zeros(1,n);
for i = 1:n-1
    C(i) = S(i,i+1);
    A(i) = S(i+1,i);
    D(i) = S(i,i);
end
D(n) = S(n,n);

X=zeros(n,1);

for k=2:n
   mult=A(k-1)/D(k-1);
   D(k)=D(k)-mult*C(k-1);
   B(k)=B(k)-mult*B(k-1);
end
X(n)=B(n)/D(n);
for k= n-1:-1:1
   X(k)=(B(k)-C(k)*X(k+1))/D(k);
end

end

