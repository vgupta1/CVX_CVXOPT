%%%%%%%
% Regularized Least Squares in 'For' Loop
%%%%%%%
% Created by V. Gupta 13 Jan 2013


%% Load test data from a file
y = csvread('testResponse.csv');
A = csvread('testSignals.csv');
m = size(A, 1);
n = size(A, 2);

%% Loop version of Least Squares
cvx_begin
    variables x(n) r(m)
    dual variable p{m}
    
    for i = 1:m
        p{i} : r(i) == y(i) - A(i, :) * x
    end
    
    minimize norm(r, 2) + norm(x, 1)
cvx_end
