%Generate a probability distribution on 1 -100 with norm

supp = (1:100)./10
p = zeros(100, 1)
for i = 1:100
    p(i) = normcdf((supp(i) - 6)/2) - normcdf((supp(i) - 6.1)/2)
end
p = p/sum(p)


%%
ub_moments = zeros(8, 1)
for i = 1:8
    ub_moments(i) = supp.^i * p
end


%ub_moments = ub_moments * 1.05