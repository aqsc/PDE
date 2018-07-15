%% adams with 3 degree by default

function [t, u] = Adams(mint, maxt, h, u0, myfun, method)

N = (maxt - mint) / h;
%% handling exceptions
if N ~= floor(N)
    disp('input a appropriate h so that the N is an interger');
    return;
end


%% calculate the value on each node
u = zeros(1, N+1);
t = (0:N).*h + mint;
u(1) = u0;

%% initialize by improved-euler
[t_init, u_init] = ImproveEuler(mint, maxt, h, u0, myfun);

if strcmp(method, 'out')
    %% initialize
    for k = 1:4
        u(k) = u_init(k);
    end
    
    %% perform adams
    for i = 4:N
        u(i+1) = u(i) + h/24 * (55*myfun(u(i)) - 59*myfun(u(i-1)) + 37*myfun(u(i-1)) - 9*myfun(u(i-1)) );
    end
elseif strcmp(method, 'in')
    %% initialize
    for k = 1:3
        u(k) = u_init(k);
    end
    
    for i = 3:N
        Fnext = u(i) + 1;
        Fprev = u(i);
        %% converge after a few iteration
        while(abs(Fprev-Fnext) > 1e-9)
            Fnext = u(i) + h/24 * (9*myfun(Fprev) + 19*myfun(u(i)) - 5*myfun(u(i-1)) + myfun(u(i-2)) );
            Fprev = Fnext;
        end
        u(i+1) = u(i) + h/24 * (9*myfun(Fnext) + 19*myfun(u(i)) - 5*myfun(u(i-1)) + myfun(u(i-2)) );
    end
end

end