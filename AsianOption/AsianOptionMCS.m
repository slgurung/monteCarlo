%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FRE 6251 Numerical and Simulation Techniques in Finance
% Assignment #1
% Name: Surya L Gurung     ID: 0449604
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (1) Monte Carlo Simulation of Asian Option

% So = Initial stock price
% K = Strike price
% r = Risk free rate
% T = Maturity time
% sigma = Stock Volatility
% n = Number of path
% m = Number of time-steps
% For an example, suppose followings are the values of parameters;
So = 100;
K = 110;
r = 0.05;
sigma = 0.20;
T = 1;
n = 1;
m = 100;
disp('(1)Example of Monte Carlo Simualtion of Asian Option with 100 paths.')
[v, sDev] = AsianOption(So, K, T, r, sigma, n, m);
OptionPrice = v
standardDeviation = sDev

% (2)Error estimate:
disp('(2) Error estimate:')
errorEstimate = 1.96 * (sDev/sqrt(n))

% (3) For one digit accuracy:
disp('(3) For 1 decimal digit accuracy, paths needed is: 100,000')
n = 100000;     % number of paths needed
[v, sDev] = AsianOption(So, K, T, r, sigma, n, m);
error = 1.96 * (sDev/sqrt(n)) 

% (4) For 3 decimal digits accuracy;
disp('(4)For 3 decimal digit accuracy, paths needed is: 1,000,000,000')
%From book, for one digit of accuracy we need 100 times more points.
%So, we need 10000 times more than 1 digit of accuracy.
%n = 1000000000;  and This number exceed the max variable value allowed 
%[v, sDev] = AsianOption(So, K, T, r, sigma, n, m);
%error = 1.96 * (sDev/sqrt(n)) 
