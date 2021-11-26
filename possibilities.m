function S = possibilities(S)
% computes the possibilities for demand changes for each type
% input: S ... parameters, demand, prices and expenditures
% output: S ... updated with q_A (vector with possibilities of demand changes for A)
%                            q_B (vector with possibilities of demand changes for B)
%                            q_C (vector with possibilities of demand changes for C)

S.q_A = zeros(1,24);
S.q_B = zeros(1,24);
S.q_C = zeros(1,24);

for i = 1:24
    S.q_A(i) = min(100, S.a1*abs((S.P_new(i)-S.P_init(i))/S.P_init(i))*100+S.a2*S.S_A);
    S.q_B(i) = min(100, S.a1*abs((S.P_new(i)-S.P_init(i))/S.P_init(i))*100+S.a2*S.S_B);
    S.q_C(i) = min(100, S.a1*abs((S.P_new(i)-S.P_init(i))/S.P_init(i))*100+S.a2*S.S_C);
end

end