function f = f(x,y)
%F Summary of this function goes here
%   Detailed explanation goes here

% [x,y] = meshgrid(0:h:1,0:h:1);
% f = - 2*pi^2*exp(pi*(x + y))*(sin(pi*(x+y)));
f = - 2*pi^2*exp(pi*(x + y))*(sin(pi*x)*cos(pi*y)+cos(pi*x)*sin(pi*y));

end

