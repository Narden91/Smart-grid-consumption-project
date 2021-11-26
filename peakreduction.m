function S = peakreduction(S)
% computes the variance of the electricity demand as a measure of peak
% reduction/smoothness and compares the new and old peaks
% input: S ... parameters, demand, prices, expenditures, possibilities, new
%              demand, savings
% output: S ... updated with demand variance and peaks

S.demand_var_init = var(S.N_A*S.D_init_A + S.N_B*S.D_init_B + S.N_C*S.D_init_C);
S.demand_var_new = var(S.N_A*S.D_new_A + S.N_B*S.D_new_B + S.N_C*S.D_new_C);

demand_total_sort_init = sort(S.N_A*S.D_init_A + S.N_B*S.D_init_B + S.N_C*S.D_init_C,'descend');
demand_total_sort_new = sort(S.N_A*S.D_new_A + S.N_B*S.D_new_B + S.N_C*S.D_new_C,'descend');
S.demand_peak_init1 = demand_total_sort_init(1);
S.demand_peak_new1 = demand_total_sort_new(1);

S.demand_peak_init3 = sum(demand_total_sort_init(1:3));
S.demand_peak_new3 = sum(demand_total_sort_new(1:3));
end