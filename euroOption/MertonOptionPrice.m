
% Function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FRE 6251 Numerical and Simulation Techniques in Finance
% Assignment #3
% Name: Surya L Gurung     ID: 0449604
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [optionPrice, error]=MertonOptionPrice(S, K, r, sigma, lambda, T, cORp, n, path)
    % S = initial price of asset 
    % K = strike price 
    % r = risk-free rate 
    % sigma = standard deviation of asset 
    % lambda = expected jump number per year
    % T = time to maturity in year
    % cORp = option type, 1 for call and -1 for put put option
    % n = number of time steps
    % path = number of paths
    
    dT = T/n; 
    %Z = randn(1,n); % random number vector of 1xn size drawn from standard normal distribution.
	%N = poissrnd(lambda * dT , 1, n); % 1xn matrix of random variable drawn from  poisson distribution
    Xt(1) = log(S); % log of initial asset price
    format long g
    a = - 5;
    b = .5;
    m = exp(a + 0.5 * b^2);
    mu = r - lambda * m;
    
    hold on
    for i = 1:path
        for j = 1:n
            Z = normrnd(0,1);
            N = poissrnd(lambda * dT);
            if N == 0    % No jump
                M = 0;
            else            % There is jump
                %j = 9
                Yj = lognrnd(mu, sigma, 1, N);  % Generating Yi
                M = sum(log(Yj)) ;                 % Sum of Log(Yi)
            end
            Xt(j+1) = Xt(j) + (mu - 0.5*sigma^2) * dT + sigma * sqrt(dT) * Z + M;
        end
        if (path < 10000)
            plot(0:n, exp(Xt));
            title('Merton Option Pricing in Jump-Diffusion Model');
            xlabel(['Time step = ', num2str(n)]);
            ylabel('Asset Price');
            
        end
        optionVals(i) = exp(-r*T)* max(cORp*(exp(Xt(n+1)) - K),0);    
    end
    hold off
    optionPrice = mean(optionVals);
    error = 1.96 * (std(optionVals)/sqrt(path));

    