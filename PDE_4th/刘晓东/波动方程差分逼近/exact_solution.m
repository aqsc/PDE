function [ y ] = exact_solution( x, t )
%% ��ȷ��

y = sin( pi * ( x - t ) ) + sin( pi * ( x + t ) );

end

