function A = a_j(j)
%JIE Summary of this function goes here
%   Detailed explanation goes here
syms s
ranks = 1;
if j == 0
    a_j = 1;
    a_jx = 1;
else
    for i =1:j
        ranks = ranks*(-s-i+1)/(j-i+1);        
    end
    a_j = (-1)^j*int(ranks,0,1);      % 外插法
    a_jx = (-1)^j*int(ranks,-1,0);    % 内插法
end
A = [a_j a_jx] ;
end