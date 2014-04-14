%%%%%%%
% L1 Regularization Tradeoff
%%%%%%%
% Created by V. Gupta 1 Jan 2013


%% Load test data from a file
y = csvread('testResponse.csv');
A = csvread('testSignals.csv');
m = size(A, 1);
n = size(A, 2);

%% Solve sequence of L1 regularized least-squares
% over lambdas grid

lambdas = -3:.1:3;
lambdas = 2.^lambdas;
out = [];

for i = 1:length(lambdas)
    lambdas(i)
    cvx_begin quiet
        variable x(n)
        minimize norm(y - A * x, 2) + lambdas(i) * norm(x, 1)
    cvx_end

    %Record residual, num-nonzeros, opt_val
    t = [lambdas(i), ...
         norm(y - A * x, 2), ...
         norm(x, 1), ...
         sum( abs(x) > 1e-8), ...
         cvx_optval];
    out = [out; t]; 
end    

%% Plot L1 norm vs residual tradeoff curve
plot(out(:, 2), out(:, 3), 's-r')
ylabel('L1 Norm', 'FontSize', 16)
xlabel('Residual', 'FontSize', 16)
title('Residual v. L1 Trade-Off', 'FontSize', 16)
grid

%% Plot NumNonZeros vs residual tradeoff curve
plot(out(:, 2), out(:, 4), 's-r')
ylabel('Num NonZero', 'FontSize', 16)
xlabel('Residual', 'FontSize', 16)
title('Residual v. NonZero Trade-Off', 'FontSize', 16)


