function [ y ] = exact_solution( x, t )
%% ¾«È·½â

y = sin( pi * ( x - t ) ) + sin( pi * ( x + t ) );

end

