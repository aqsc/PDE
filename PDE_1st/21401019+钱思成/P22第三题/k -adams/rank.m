function rank = rank(s,j)
%JIE Summary of this function goes here
%   Detailed explanation goes here

rank = 1;
if j == 0
    rank = 1;
else
    for i =1:j
        rank = rank*(s-i+1)/(j-i+1);
    end
end



