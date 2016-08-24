
% Function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FRE 6251 Numerical and Simulation Techniques in Finance
% Assignment #2
% Name: Surya L Gurung     ID: 0449604
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [optionPrice, error]=SpreadOption(S1, S2, K, r, sigma1, sigma2, rho, T, cORp, n)
    % S1 = initial price of asset 1
    % S2 = initial price of asset 2
    % K = strike price 
    % r = risk-free rate 
    % sigma1 = standard deviation of asset 1
	% sigma2 = standard deviation of asset 2
    % rho = correlation coefficient
    % T = time to maturity
    % cORp = option type, 1 for call and -1 for put put option
    % n = number of simulations
    
    
    z1 = randn(1,n); % random number vector of 1xn size drawn from standard normal distribution.
	z2 = rho*z1 + randn(1,n) * sqrt(1-rho^2); % using Levy representation of GBM
    
	stock1 = S1 * exp((r- 0.5*sigma1^2) * T + sigma1 * sqrt(T) * z1); % vector of prices of asset 1
    stock2 = S2 * exp((r- 0.5*sigma2^2) * T + sigma2 * sqrt(T) * z2); % vector of prices of asset 2
    
	payoffVals = exp(-r*T)* max(cORp*(stock1 - stock2 - K),0); % vector of payoffs
	optionPrice = mean(payoffVals); % option price
	error = 1.96*(std(payoffVals)/sqrt(n)); 
    
    % example graph of asset prices for n = 10
    if n == 10
        hold on
        for i = 1: n
        plot([0, 1], [S1,stock1(i)])
        plot([0, 1], [S2,stock2(i)], 'r')
        end
        hold off
        title('Spread Option: Asset prices at end of 1 year');
        xlabel('Blue = Asset 1, Red = Asset 2');
    end
        
    