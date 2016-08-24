%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FRE 6251 Numerical and Simulation Techniques in Finance
% Assignment #5
% Name: Surya L Gurung     ID: 0449604
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Monte Carlo Simulation of Asian Option Importance Sampling
%-----------------------------------------------------------
    % Parameter Description:
    
    % So = initial price of asset 
    % K = strike price 
    % r = risk-free rate  
    % sigma = standard deviation of asset 
    % T = time to maturity in year
    % cORp = option type, 1 for call and -1 for put put option
    % tSteps = number of time steps
    % pNum = number of paths
    
    %-----------
    % Example 1:
    %----------- 
    So = 100;
    K = 110; 
    r = 0.05;
    sigma = 0.2;
    T = 1; 
    cORp = 1; % this is for call option
    tSteps = 20;
    pNum = 100;
    row = 1;
  
    
    disp('Result Interpretation:')
   
    disp(' ')
    
    disp(sprintf('%s', '  Paths        Option Price    error' ))
    disp(sprintf('%s', ' ----------    -----------     ------' ))
    
    while pNum < 1000000
        [Y, error1] = ImportanceSampling(So, K, r, sigma, T, cORp, tSteps, pNum);
        if row == 1
            disp(sprintf('  %d          %0.6f        %0.6f', pNum, Y, error1))
        elseif row == 2
            disp(sprintf('  %d         %0.6f        %0.6f', pNum, Y, error1))   
        elseif row == 3 
            disp(sprintf('  %d        %0.6f       %0.6f', pNum, Y, error1))   
        elseif row == 4
            disp(sprintf('  %d       %0.6f     %0.6f     %0.6f', pNum, Y, error1))   
        elseif row == 5 
            disp(sprintf('  %d      %0.6f     %0.6f     %0.6f ', pNum, Y, error1))   
        elseif row == 6
            disp(sprintf('  %d     %0.6f     %0.6f     %0.6f', pNum, Y, error1))   
        end
        pNum = pNum * 10;
        row = row + 1;
    end
   