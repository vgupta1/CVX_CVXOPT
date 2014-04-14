%%%%%%%
% Testing CVX Installation
%%%%%%%
% Created by V. Gupta 1 Jan 2013


%% Load test data from a file
y = csvread('testResponse.csv');
A = csvread('testSignals.csv');
m = size(A, 1);
n = size(A, 2);

%% Solve a "mystery" optimization
cvx_begin
    variable x(n) 
    variable r(m)

    dual variable lambda
    lambda: r == y - A * x

    minimize norm(r, 2)
    
    
cvx_end

%% Display some ouput
cvx_status
cvx_optval
x


%% Initial Questions
% What is this optimizaton doing?
% What is the dimension of x?  the value of x_1?
% How many non-zero components does x have?
% Is this a good model?  (To be discussed)
