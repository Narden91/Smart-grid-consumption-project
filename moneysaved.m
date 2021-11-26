function S = moneysaved(S)
% computes the amount of money which could be safed by the agents due to
% changes in their demand
% input: S ... parameters, demand, prices, expenditures, possibilities, new
%              demand
% output: S ... updated with savings for agents and total expenditures for 
%               the grid operator 

% agents
S.saving_A = (S.Exp_new_A-S.Exp_init_A);
S.saving_A_perc = (S.Exp_new_A-S.Exp_init_A)/S.Exp_init_A*100;
S.saving_B = (S.Exp_new_B-S.Exp_init_B);
S.saving_B_perc = (S.Exp_new_B-S.Exp_init_B)/S.Exp_init_B*100;
S.saving_C = (S.Exp_new_C-S.Exp_init_C);
S.saving_C_perc = (S.Exp_new_C-S.Exp_init_C)/S.Exp_init_C*100;

% total
S.Exp_new_total = S.N_A*S.Exp_new_A+S.N_B*S.Exp_new_B+S.N_C*S.Exp_new_C;
S.Exp_init_total = S.N_A*S.Exp_init_A+S.N_B*S.Exp_init_B+S.N_C*S.Exp_init_C;
S.saving_total = (S.Exp_new_total - S.Exp_init_total);
S.saving_total_perc = (S.Exp_new_total - S.Exp_init_total)/S.Exp_init_total*100;

end