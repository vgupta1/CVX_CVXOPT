%%% Simple example demonstrating SDP functionality for CVX
% Created by V. Gupta 24 Jan 2013
cvx_begin
    variable X(3, 3)
    X == semidefinite(3)
    
    5 * X(1,1) + 2 * X(2, 3) - X(3, 3) == 1
    2 * X(2, 2) + 3 * X(3, 3) <= 2
    
    minimize 3 * X(1, 1) - 2 * X(2, 3)

    
cvx_end