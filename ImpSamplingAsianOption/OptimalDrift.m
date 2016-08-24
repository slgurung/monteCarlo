
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FRE 6251 Numerical and Simulation Techniques in Finance
% Assignment #5
% Name: Surya L Gurung     ID: 0449604
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [mu] = OptimalDrift(So, K, r, sigma, T, tSteps)
    % Parameter Description:
    
    % So = initial price of asset 
    % K = strike price 
    % r = risk-free rate  
    % sigma = standard deviation of asset 
    % T = time to maturity in year
    % cORp = option type, 1 for call and -1 for put put option
    % tSteps = number of time steps
    % pNum = number of paths
    
    format long g
    dT = T/tSteps;
    syms y   
    
    Zp = 0;
    Sp = So;
    sum = 0;
    m = 2;
    
    const1 = (r - 0.5 * sigma^2) * dT ;
    const2 = sigma * sqrt(dT);
   
    Z1 = @(y) (sigma*sqrt(dT)*(y + K))/y;
    f1 = @(y) (So*exp(const1 + ((const2*sigma*sqrt(dT)*(y + K))/y))) - K - y;
    sPrice = @(y) Sp*exp(const1 + const2*y);
    
    y = bisection(f1, 0, 100, .0000001, .0000001);
    Z(1) = Z1(y);
    S1 = sPrice(Z(1));
    sum = sum + S1;
    Sp = S1;
    Zp = Z(1);
    
    for i = 2:tSteps
        m = i;
        sPrice = @(y) Sp*exp(const1 + const2*y);
        Zj = @(y) Zp - ((sigma * sqrt(dT)* Sp)./(m*y));
        f2 = @(y)  ((sum + Sp*exp(const1 + const2*(Zp - (sigma*sqrt(dT)*Sp/(m*y)))))/m) - K -y;
       
        y = bisection(f2, -1, 1000, .0000001, .0000001);
        Z(i) = Zj(y);
        Sp = sPrice(Z(i));
        Zp = Z(i);
        sum = sum + Sp;
    end
    mu = Z;
    