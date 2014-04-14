%%%%%%%
% Timing Comparisons for CVX on regularized least squares
%%%%%%%
% Created by V. Gupta 13 Jan 2013


%Gen some random data
m = 100;
n = 20;
A = randn(m, n);
y = randn(m, 1);
lambda = 2.^(.1 * (0:99) - 5)
tot_cputime = 0;
tot_time = 0;
tic;
for i = 10:10:100
    cvx_begin 
        variable x(n) 
        minimize norm(y - A*x, 2) + lambda(i) * norm(x, 1)

    %uncomment this tic to geta n approx solver time
    %tic;    
    cvx_end
    tot_time = tot_time + toc;

    tot_cputime = tot_cputime + cvx_cputime;
end

tot_cputime
tot_time
tot_time / tot_cputime

% Gurobi
% 53.2 s cputime
% 22.9 s tot_time

