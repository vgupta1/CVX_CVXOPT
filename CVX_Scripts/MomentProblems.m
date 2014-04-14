%%%%%%%
% Moment Problems
% Finds a max entropy distribution on given support
% that approximately satisfies the given moment conditions
%%%%%%%
% Created by V. Gupta 13 Jan 2013

%% Read in the required moments
moments = csvread('Moments.csv');
numMoments = size(moments, 1);

%% Form required optimization problem
supp = (1:100)./10;
cvx_begin
    variable p(length(supp))
    maximize sum(entr(p));
    
    %must be a probability
    p >= 0;
    sum(p) == 1;  
    
    for i = 1:numMoments
        supp.^i * p <= 1.05 * moments(i);
        supp.^i * p >= .95 * moments(i);
    end
    
cvx_end

%% Plot some output
figure(1)
bar(p)
ylabel('Prob', 'FontSize', 15)
title('Distribution', 'FontSize', 15)

%Plot the dual variables
figure(2)


%% Tasks:
% Add dual variable for the normalization constraint
% Add dual variables for the moment constraints
% Add a plot for of the dual variables in figure(2)

%% Challenge questions:
% Could you have written this optimization without the loop?