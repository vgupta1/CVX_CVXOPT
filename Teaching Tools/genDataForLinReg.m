%%
%Generate a good linear regression
%These were used for the L1 Regularized examples
t = rand(100, 1) * 15
t = sort(t)
%%
A = [sin(2 * pi * t), sin(3 * pi * t), sin(4 * pi * t), ones(100, 1), t]
x = [3; 3; 1.5; 3; .5]


%%
%Add some spurious Columns to A
%M = rand(5, 5)
A2 = [A, A * M + .001 * randn(100, 5)]


%%
%Add some noise to the outputs
y = A * x + .5 * randn(100, 1);

clf
plot(t, A * x, 's-b')
hold on;
plot(t, y, '.-r')
hold off;


%%
csvwrite('testSignals.csv', A2)
csvwrite('testResponse.csv', y)

%%
cvx_begin
    variables t x(2)
    sqrt(x(1)^2 + x(2)^2) <= t
    minimize t
cvx_end
