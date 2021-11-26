function S = newprices(S)
% update S with new prices: prices during the 6 peak hours increase by x%, prices
% during 6 low demand hours decrease by x%
% input: S ... parameters, demand, price and expenditure
% output: S ... updated with P_new (new prices set by grid operator)

x = 20; % percentage change in prices

demand_total = S.D_init_A.*S.N_A + S.D_init_B.*S.N_B + S.D_init_C.*S.N_C;
demand_total_sort = sort(demand_total,'descend');
S.P_new = zeros(1,24);

for i=1:24
    if demand_total(i) >= demand_total_sort(6)
        S.P_new(i) = S.P_init(i)*(1+x/100);
    elseif demand_total(i) <= demand_total_sort(19)
        S.P_new(i) = S.P_init(i)*(1-x/100);
    else
        S.P_new(i) = S.P_init(i);
    end
end

end