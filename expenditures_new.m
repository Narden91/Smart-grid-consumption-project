function S = expenditures_new(S)
% computes the new expenditures for electricity for each type
% input: S ... parameters, demand, prices, expenditure, possibilities, new
%              demand
% output: S ... updated with Exp_new_A (new expenditures type A)
%                            Exp_new_B (new expenditures type B)
%                            Exp_new_C (new expenditures type C)

S.Exp_new_A = sum(S.P_new .* S.D_new_A);
S.Exp_new_B = sum(S.P_new .* S.D_new_B);
S.Exp_new_C = sum(S.P_new .* S.D_new_C);

end