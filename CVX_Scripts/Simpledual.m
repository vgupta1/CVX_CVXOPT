%%%%%%%
% Max Entropy Problem with Dual Vars
% Solves a simple max-entropy problem on given
% support
%%%%%%%
% Created by V. Gupta 1 Jan 2013

supp = 1:10;

cvx_begin
    variable p(length(supp))
    maximize sum(entr(p))

    %must be a probability
    sum(p) == 1;  p >= 0;

    %Constrain mean
    %But incorporate a dual variable
    %notice we DO NOT write dual variable lambda(1)
    dual variable lambda
    lambda : supp * p == 4;
    
cvx_end

%Plot some output
p
bar(p)
ylabel('Prob', 'FontSize', 15)
title('Max Entropy Distribution', 'FontSize', 15)