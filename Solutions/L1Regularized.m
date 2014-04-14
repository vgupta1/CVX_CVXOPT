%%%%%%%
% Simple L1 Regularization
%%%%%%%
% Created by V. Gupta 1 Jan 2013


%% Load test data from a file
y = csvread('testResponse.csv');
A = csvread('testSignals.csv');
m = size(A, 1);
n = size(A, 2);


%% Solve L1 regularized least-squares
cvx_begin 
    variable x(n)
    minimize norm(y - A * x, 2) + norm(x, 1)

    %Optionally constrain components:
    %-10 <= x <= 10
    % or
    %-10 * ones(n, 1) <= x <= 10 * ones(n, 1)
cvx_end

%Some notes
% Composing functions is ok, as long as still DCP convex.
%    More later on this.
% Can omit the "subject to" before constraints
% Vector inequalities are ok
%    Need to be careful how interpreted in SDP Mode.  
