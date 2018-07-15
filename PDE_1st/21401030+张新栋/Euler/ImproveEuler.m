%% minX and maxX is the range of the domain
%% h is the length of the step\
%% f0 the initial value of myfun, expecially f0 = myfun(minX)
%% myfun is the right hand side function
function [t, u]= ImproveEuler(mint, maxt, h, u0, myfun)
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
for i = 2:N+1
    Fnext = u(i-1) + 1;
    Fprev = u(i-1);
    %% calculate the non-linear equations
    %% converge after a few iterations
    while(abs(Fprev-Fnext) > 1e-9)
        Fnext = u(i-1) + h / 2 * (myfun(u(i-1)) + myfun(Fprev));
        Fprev = Fnext;
    end
    u(i) = u(i-1) + h / 2 * (myfun(u(i-1)) + myfun(Fnext));
end

%% end of the function
end




