function [ f ] = funf( x,y )
%% the right function for each point

f = -2 * (pi)^2 * exp( pi * ( x + y )) * (sin(pi * x) * cos(pi * y) + cos(pi * x) * sin(pi * y));

end

