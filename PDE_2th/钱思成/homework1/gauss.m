function x = gauss(A,B)
%GAUSS Summary of this function goes here
%   Detailed explanation goes here
format long;
n = size(B,1);
x0 = zeros(n,1);   % Éè¶¨³õÖµ
D = diag(diag(A));
L = -tril(A,1);
U = -triu(A,1);
G = (inv(D-L))*U;
f = (inv(D-L))*B;
x1 = G*x0 + f;
n = 1;
while(norm(x1 - x0)>=0.000001)
    x0 = x1;
    x1 = G*x0+f;
    n = n+1;
end

x = x1;

