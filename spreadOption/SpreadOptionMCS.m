%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FRE 6251 Numerical and Simulation Techniques in Finance
% Assignment #2
% Name: Surya L Gurung     ID: 0449604
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (Monte Carlo Simulation of Spread Option
%------------------------------------------
    % Parameter Description:
    
    % S1 = initial price of asset 1
    % S2 = initial price of asset 2
    % K = strike price 
    % r = risk-free rate 
    % sigma1 = standard deviation of asset 1
	% sigma2 = standard deviation of asset 2
    % rho = correlation coefficient
    % T = time to maturity in years
    % cORp = option type, 1 for call and -1 for put put option
    % n = number of simulations
    
    %----------
    % Example
    %----------
    S1 = 110;
    S2 = 105;
    K = 2; 
    r = 0.05;
    sigma1 = 0.15;
    sigma2 = 0.20;
    rho = 0.25;
    T = 1; 
    cORp = 1; % this is for call option
    n = 10;
    row = 1;
    
    format long g
    disp(['                         n', '          Option Price', '              Error Estimation'])
    disp(['                    ------', '         ---------------', '          -------------------'])
    
    while n < 10000000
        [optionPrice, error] = SpreadOption(S1, S2, K, r, sigma1, sigma2, rho, T, cORp, n);
        result(row,:) = [n, optionPrice, error];
        n = n * 10;
        row = row + 1;
    end
    disp(result);
    