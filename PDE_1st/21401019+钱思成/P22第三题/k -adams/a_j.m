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
    a_j = (-1)^j*int(ranks,0,1);      % ��巨
    a_jx = (-1)^j*int(ranks,-1,0);    % �ڲ巨
end
A = [a_j a_jx] ;
end