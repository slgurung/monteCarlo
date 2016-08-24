%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FRE 6251 Numerical and Simulation Techniques in Finance
% Assignment #3
% Name: Surya L Gurung     ID: 0449604
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Monte Carlo Simulation of Jump-Diffusion Mertion Option
%-----------------------------------------------------------
    % Parameter Description:
    
    % S = initial price of asset 
    % K = strike price 
    % r = risk-free rate 
    % sigma = standard deviation of asset 
    % lambda = expected jump number per year
    % T = time to maturity in year
    % cORp = option type, 1 for call and -1 for put put option
    % n = number of time steps
    % path = number of paths
    
    %----------
    % Example
    %----------
    S = 100;
    K = 115; 
    r = 0.05;
    sigma = 0.20;
    lambda = 4;
    T = 1; 
    cORp = 1; % this is for call option
    n = 10;
    path = 10;
    
    row = 1;
    format long g
    disp(['                      path', '          Option Price', '              Error Estimation'])
    disp(['                    ------', '         ---------------', '          -------------------'])
    
    while path < 1000
        [optionPrice, error] = MertonOptionPrice(S, K, r, sigma, lambda, T, cORp, n, path);
        result(row,:) = [path, optionPrice, error];
        path = path * 10;
        row = row + 1;
    end
    disp(result);
    