%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FRE 6251 Numerical and Simulation Techniques in Finance
% Assignment #4
% Name: Surya L Gurung     ID: 0449604
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Closed-form solution for Geometric Average Asian Option
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [price] = geometricAvgOption(So, K, r, sigma, T, cORp)
    % Parameter Description:
    
    % So = initial price of asset 
    % K = strike price 
    % r = risk-free rate  
    % sigma = standard deviation of asset 
    % T = time to maturity in year
    % cORp = option type, 1 for call and -1 for put put option
    
    b = 0.5 * (r- (sigma^2/6));
    sigmaA = sigma / sqrt(3);

    d1 = (log(So/K) + (b + 0.5 * sigmaA^2)* T)/(sigmaA * sqrt(T));
    d2 = d1 - sigmaA * sqrt(T); 
    
    price = cORp*(So*exp((b - r)*T)*normcdf(cORp*d1) - K*exp(-r*T)*normcdf(cORp*d2));
    
    