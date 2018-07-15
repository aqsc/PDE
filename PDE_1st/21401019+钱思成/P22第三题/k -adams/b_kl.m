function b_kl= b_kl(k,l )
%B_KL Summary of this function goes here
%   Detailed explanation goes here
b_kl = 0;
for j = l:k
    A = a_j(j);
    b_kl = b_kl + A(1)*rank(j,l);
end

if l == 0
    b_kl = 1*b_kl;
else 
    b_kl = (-1)^l*b_kl;
end

