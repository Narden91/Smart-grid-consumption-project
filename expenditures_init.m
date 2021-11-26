function S = expenditures_init(S)
% computes the initial expenditures for electricity for each type
% input: S ... parameters, demand and price
% output: S ... updated with Exp_int_A (initial expenditures type A)
%                            Exp_int_B (initial expenditures type B)
%                            Exp_int_C (initial expenditures type C)

S.Exp_init_A = sum(S.P_init .* S.D_init_A);
S.Exp_init_B = sum(S.P_init .* S.D_init_B);
S.Exp_init_C = sum(S.P_init .* S.D_init_C);

end