function S = simul(S)
% runs the simulation N_Sim times and computes the average new demand for
% electricity for each type
% input: S ... parameters, demand, prices, expenditures, possibilities
% output: S ... updated with D_new_A (new demand for type A)
%                            D_new_B (new demand for type B)
%                            D_new_C (new demand for type C)

bernoulli_A = zeros(1,24); % for the random variables
bernoulli_B = zeros(1,24);
bernoulli_C = zeros(1,24);

D_A_help = zeros(1,24); % auxiliary variables (within one simulation)
D_B_help = zeros(1,24);
D_C_help = zeros(1,24);

D_A_new = zeros(1,24); % average electricity demand (over all simulations)
D_B_new = zeros(1,24);
D_C_new = zeros(1,24);

D_min_A = min(S.D_init_A); % min electricity consumption
D_min_B = min(S.D_init_B);
D_min_C = min(S.D_init_C);

N_Sim = 1000; %repeat 1000 times

for j = 1:N_Sim 
    for i = 1:24
        bernoulli_A(i) = binornd(1,(S.q_A(i)/100)); % 1: I can shift demand, 0: I cannot shift demand 
        bernoulli_B(i) = binornd(1,(S.q_B(i)/100));
        bernoulli_C(i) = binornd(1,(S.q_C(i)/100));      
    end
  
    % type A
    if sum(bernoulli_A) > 1
        D_A_help(bernoulli_A==0) = S.D_init_A(bernoulli_A==0); %demand does not change
        D_A_help(bernoulli_A==1) = D_min_A;                    %demand changes
        index_A = (S.P_new==min(S.P_new(bernoulli_A==1)) & bernoulli_A==1); %indeces with lowest price available for change
        D_A_help(index_A) = D_min_A + (sum(S.D_init_A)-sum(D_A_help))/sum(index_A); %shift to lowest prices
        D_A_new = D_A_new + D_A_help;
    else
        disp('Demand of type A could not be changed.')
        D_A_new = D_A_new + S.D_init_A;
    end
    % type B
    if sum(bernoulli_B) > 1
        D_B_help(bernoulli_B==0) = S.D_init_B(bernoulli_B==0); %demand does not change
        D_B_help(bernoulli_B==1) = D_min_B;                    %demand changes
        index_B = (S.P_new==min(S.P_new(bernoulli_B==1)) & bernoulli_B==1); %indeces with lowest prices available for change
        D_B_help(index_B) = D_min_B + (sum(S.D_init_B)-sum(D_B_help))/sum(index_B); %shift to lowest prices
        D_B_new = D_B_new + D_B_help;
    else
        disp('Demand of type B could not be changed.')
        D_B_new = D_B_new + S.D_init_B;
    end
    % type C
    if sum(bernoulli_C) > 1
        D_C_help(bernoulli_C==0) = S.D_init_C(bernoulli_C==0); %demand does not change
        D_C_help(bernoulli_C==1) = D_min_C;                    %demand changes
        index_C = (S.P_new==min(S.P_new(bernoulli_C==1)) & bernoulli_C==1);     %indeces with lowest prices available for change
        D_C_help(index_C) = D_min_C + (sum(S.D_init_C)-sum(D_C_help))/sum(index_C); %shift to lowest prices
        D_C_new = D_C_new + D_C_help;
    else
        disp('Demand of type C could not be changed.')
        D_C_new = D_C_new + S.D_init_C;
    end
end

S.D_new_A = D_A_new ./ N_Sim; % new demand 
S.D_new_B = D_B_new ./ N_Sim;
S.D_new_C = D_C_new ./ N_Sim;
end