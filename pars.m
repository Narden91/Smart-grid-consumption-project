% Defines parameter values, prices and demand
% stores them in a structural array S

% initialize S
S = struct();

%% parameters
% number of agents
S.N = 100;
% number of agents type A
S.N_A = 60;
% number of agents type B
S.N_B = 25;
% number of agents type c
S.N_C = 15;

% parameter of awareness type A in %
S.S_A = 30;
% parameter of awareness type B in %
S.S_B = 10;
% parameter of awareness type C in %
S.S_C = 80;

% weight price change
S.a1 = 0.5;
% weight parameter of awareness
S.a2 = 0.5;

%% electricity demand in kW
% demand type A
S.D_init_A = [0.508,0.507,0.513,0.552,0.588,0.611,0.815,0.997,1.324,1.67,0.412,0.433,0.441,0.432,0.468,0.855,1.291,1.708,2.14,1.933,1.27,1.133,0.478,0.392];
% demand type B
S.D_init_B = [1.088,1.276,1.466,1.481,1.254,0.849,0.648,0.423,0.438,0.435,0.441,0.447,0.437,0.429,0.445,0.652,0.647,0.861,1.249,1.488,1.274,1.093,0.886,0.852];
% demand type C
S.D_init_C = [0.502,0.506,0.512,0.514,0.856,1.056,1.087,1.079,0.851,0.863,1.077,1.056,1.012,0.844,0.877,1.049,1.276,1.259,1.491,1.073,0.611,0.425,0.442,0.451];


%% price for electricity in EUR/kWh
% First initial orice vector
S.P_init = [0.03024,0.0229,0.02023,0.02017,0.02,0.01992,0.0224,0.02588,0.03217,0.03269,0.03217,0.028,0.02588,0.02483,0.025,0.02523,0.0255,0.025,0.0255,0.02591,0.03331,0.03703,0.035,0.03351];

% Second initial Price vector (Germany 19.03) from: https://energy-charts.de/price.htm?auction=1h&year=2020&week=12
%S.P_init = [0.02075,0.02049,0.01928,0.02002,0.02269,0.03012,0.03213,0.02905,0.02374,0.02195,0.02150,0.01968,0.01890,0.02033,0.02261,0.02516,0.03064,0.04214,0.04774,0.03021,0.02602,0.02668,0.02557,0.02326];

%% Hour Vector
%Vector of time
h=1:24;
