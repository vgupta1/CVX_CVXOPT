%%% Asset correlation solution
% Example of using SDP facilities
% Created by V. Gupta 24 Jan 2013

sigmas = [.6; .4; 1.2]
%%
cvx_begin
    variable rho(3,3) symmetric
    .6 <= rho(1, 2) <= .8;
    .95 <= rho(2, 3) <= .98;

    diag(rho) == 1
    -1 <= rho <= 1

    diag(sigmas) * rho * diag(sigmas) == semidefinite(3)
    
    minimize rho(1, 3)
cvx_end