
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FRE 6251 Numerical and Simulation Techniques in Finance
% Assignment #1
% Name: Surya L Gurung     ID: 0449604
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [v, sDev] = AsianOption(So, K, T, r, sigma, n, m)
    format long
    sum = 0;
    cSum = 0;
    stockPrice = zeros(1, m);
    C = zeros(1, n);
    dt = T/m;
    S = So;
    stockPrice(1) = S;
    hold on
    for i = 1:n
        for j = 1:m
            z = normrnd(0,1);
            stockPrice(j+1) = S* exp((r- (0.5 * sigma^2))*dt + sigma * dt^0.5 * z);
            S = stockPrice(j+1);
            sum = sum + S;
        end
        if n < 1000
            plot(1:m+1, stockPrice, 'r')
            xlabel('Example paths of Monte Carlo Simulation.')
        end
        S_avg = sum / m;
        sum = 0;
        S = So;
        if S_avg > K
            C(i) = (S_avg - K)/exp(r * T);
        else
            C(i) = 0;
        end
        cSum = cSum + C(i);
    end
    hold off
    % etimating standard deviation of option prices
    cAvg = cSum / n;
    sum = 0;
    for i = 1:n
        sum = sum + (C(i) - cAvg)^2;
    end
    sDev = sqrt(sum/(n-1));
    
    v = cAvg;
      