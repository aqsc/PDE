function b_klx = b_klx(k,l )
%B_KLX Summary of this function goes here
%   Detailed explanation goes here
b_klx = 0;
for j = l:k
    A = a_j(j);
    b_klx = b_klx + A(2)*rank(j,l);
end
b_klx = (-1)^l*b_klx;

end

