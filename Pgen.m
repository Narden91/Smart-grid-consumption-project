%% Script generates random price vector through 24h

clear all
clc

%hours
n = 24;

%price range
R = [0.01 0.05];

%price vector
z = rand(n,1)*range(R)+min(R);

disp('Price vector:')
disp(z)

z=z';
