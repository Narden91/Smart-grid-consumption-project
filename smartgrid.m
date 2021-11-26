%% Master file
% Authors: 
% Ciro Russo
% Tobias Grossauer
% Emanuele Nardone

%% define parameter values and functional forms
pars;

%% compute initial expenditures
S = expenditures_init(S);

%% compute new prices
S = newprices(S);

%% compute possibilities of price changes
S = possibilities(S);

%% simulation
S = simul(S);

%% compute new expenditures
S = expenditures_new(S);

%% measures of the results
% for the agents
S = moneysaved(S);

% for the grid operator
S = peakreduction(S);

% display the results
disp('   ');
disp('EXPENDITURES');
fprintf('The expenditures by agents A increased/decreased in EUR by %d.\n', S.saving_A);
fprintf('Increase/Decrease in percentage for type A: %d.\n', S.saving_A_perc);
fprintf('The expenditures by agents B increased/decreased in EUR by %d.\n', S.saving_B);
fprintf('Increase/Decrease in percentage for type B: %d.\n', S.saving_B_perc);
fprintf('The expenditures by agents C increased/decreased in EUR by %d.\n', S.saving_C);
fprintf('Increase/Decrease in percentage for type C: %d.\n', S.saving_C_perc);

disp('   ');
fprintf('The income for the grid operator increased/decreased in EUR by %d.\n', S.saving_total);
fprintf('Increase/Decrease in percentage for the grid operator: %d.\n', S.saving_total_perc);

disp('   ');
disp('PEAKREDUCTION - VARIANCE');
fprintf('The initial variance of the electricity demand is: %d.\n', S.demand_var_init);
fprintf('The new variance of the electricity demand is: %d.\n', S.demand_var_new);
fprintf('Increase/Decrease in percentage of the variance: %d.\n', (S.demand_var_new-S.demand_var_init)/S.demand_var_init*100);

disp('   ');
disp('PEAKREDUCTION - PEAKDEMAND');
fprintf('The initial highest peak of the electricity demand in kWh is given by: %d.\n', S.demand_peak_init1);
fprintf('The new highest peak of the electricity demand in kWh is given by: %d.\n', S.demand_peak_new1);
fprintf('Increase/Decrease in percentage of the peak hour: %d.\n', (S.demand_peak_new1-S.demand_peak_init1)/S.demand_peak_init1*100);

disp('   ');
fprintf('Sum of the three initial highest peak hours of the electricity demand in kWh is given by: %d.\n', S.demand_peak_init3);
fprintf('Sum of the three new highest peak hours of the electricity demand in kWh is given by: %d.\n', S.demand_peak_new3);
fprintf('Increase/Decrease in percentage of the three highest peak hours: %d.\n', (S.demand_peak_new3-S.demand_peak_init3)/S.demand_peak_init3*100);

%% plot the results 
%-------------------------Type A plot-------------------------%
% Type A plot
% figure('Name','Type A');
% plot(h,S.D_init_A,'LineWidth',1.6);
% hold on
% plot(h,S.D_new_A,'-.','LineWidth',1.6);
% hold off
% xlim([1 24]);
% xlabel('Hours');
% ylabel('Consumption [kW]');
% title('Shifted Demand for Type A Users');
% legend({'Original Behaviour','New Behaviour'},'Location','northwest')

% Type A Interpolated Version
xFit = linspace(h(1), h(end), 200);
A_init_Fitted = interp1(h, S.D_init_A, xFit, 'spline');
A_new_Fitted = interp1(h, S.D_new_A, xFit, 'spline');

figure('Name','Type A ');
plot(xFit,A_init_Fitted,'LineWidth',1.6);
hold on
plot(xFit,A_new_Fitted,'-.','LineWidth',1.6);
hold off
xlim([1 24]);
xlabel('Hours');
ylabel('Consumption [kWh]');
title('Shifted Demand for Type A Users');
legend({'Original Behaviour','New Behaviour'},'Location','northwest')

%-------------------------Type B plot-------------------------%
% Type B plot
% figure('Name','Type B');
% plot(h,S.D_init_B,'LineWidth',1.6, 'Color',[0.9290 0.6940 0.1250]);
% hold on
% plot(h,S.D_new_B,'-.','LineWidth',1.6,'Color',[0.4940 0.1840 0.5560]);
% hold off
% xlim([1 24]);
% xlabel('Hours');
% ylabel('Consumption [kW]');
% title('Shifted Demand for Type B Users');
% legend({'Original Behaviour','New Behaviour'},'Location','northwest')

%Type B Interpolated Version
B_init_Fitted = interp1(h, S.D_init_B, xFit, 'spline');
B_new_Fitted = interp1(h, S.D_new_B, xFit, 'spline');

figure('Name','Type B');
plot(xFit,B_init_Fitted,'LineWidth',1.6,'Color',[0.9290 0.6940 0.1250]);
hold on
plot(xFit,B_new_Fitted,'-.','LineWidth',1.6,'Color',[0.4940 0.1840 0.5560]);
hold off
xlim([1 24]);
xlabel('Hours');
ylabel('Consumption [kWh]');
title('Shifted Demand for Type B Users');
legend({'Original Behaviour','New Behaviour'},'Location','northwest')

%-----------------------------Type C plot----------------------------%
% Type C plot
% figure('Name','Type C');
% plot(h,S.D_init_C,'LineWidth',1.6,'Color',[0.3010 0.7450 0.9330]);
% hold on
% plot(h,S.D_new_C,'-.','LineWidth',1.6,'Color',[0.6350 0.0780 0.1840]);
% hold off
% xlim([1 24]);
% xlabel('Hours');
% ylabel('Consumption [kW]');
% title('Shifted Demand for Type C Users');
% legend({'Original Behaviour','New Behaviour'},'Location','northwest')

%Type C Interpolated Version
C_init_Fitted = interp1(h, S.D_init_C, xFit, 'spline');
C_new_Fitted = interp1(h, S.D_new_C, xFit, 'spline');

figure('Name','Type C ');
plot(xFit,C_init_Fitted,'LineWidth',1.6,'Color',[0.3010 0.7450 0.9330]);
hold on
plot(xFit,C_new_Fitted,'-.','LineWidth',1.6,'Color',[0.6350 0.0780 0.1840]);
hold off
xlim([1 24]);
xlabel('Hours');
ylabel('Consumption [kWh]');
title('Shifted Demand for Type C Users');
legend({'Original Behaviour','New Behaviour'},'Location','northwest')

%-------------------------Current Load Smart Grid-------------------------%

% Normal Version Current LOAD Smart Grid
% figure('Name','*Window name*');
% plot(h,(S.N_A*S.D_init_A + S.N_B*S.D_init_B + S.N_C*S.D_init_C),'LineWidth',1.6);
% hold on
% plot(h,(S.N_A*S.D_new_A + S.N_B*S.D_new_B + S.N_C*S.D_new_C),'LineWidth',1.6);
% hold off
% xlim([1 24]);
% xlabel('Hours');
% ylabel('label');
% title('Title');
% legend({'Original Behaviour','New Behaviour'},'Location','northwest')

%Interpolated Version Current Load Smart Grid
t_init_Fitted = interp1(h, (S.N_A*S.D_init_A + S.N_B*S.D_init_B + S.N_C*S.D_init_C), xFit, 'spline');
t_new_Fitted = interp1(h, (S.N_A*S.D_new_A + S.N_B*S.D_new_B + S.N_C*S.D_new_C), xFit, 'spline');

figure('Name','Current Load Smart Grid');
plot(xFit,t_init_Fitted,'LineWidth',1.6);
hold on
plot(xFit,t_new_Fitted,'-.','LineWidth',1.6);
hold off
xlim([1 24]);
xlabel('Hours');
ylabel('kWh');
title('Current Load Smart Grid');
legend({'Original Behaviour','New Behaviour'},'Location','northwest')

%---------------------------- Price change -------------------------------%

% %Normal Version S.P Price change
% figure;
% plot(h,S.P_init,'LineWidth',1.6);
% hold on
% plot(h,S.P_new,'LineWidth',1.6);
% hold off
% xlim([1 24]);
% xlabel('Hours');
% ylabel('label');
% title('Title');
% legend({'Original Behaviour','New Behaviour'},'Location','northwest')

%Interpolated Version Price change PLOT
f_init_Fitted = interp1(h, S.P_init, xFit, 'spline');
f_new_Fitted = interp1(h, S.P_new, xFit, 'spline');

figure('Name',' Price change');
plot(xFit,f_init_Fitted,'LineWidth',1.6);
hold on
plot(xFit,f_new_Fitted,'-.','LineWidth',1.6);
hold off
xlim([1 24]);
xlabel('Hours');
ylabel('[EUR/kWh]');
title('Prices');
legend({'Original Behaviour','New Behaviour'},'Location','northwest')
