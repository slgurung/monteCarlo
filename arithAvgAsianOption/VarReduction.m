%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FRE 6251 Numerical and Simulation Techniques in Finance
% Assignment #4
% Name: Surya L Gurung     ID: 0449604
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Monte Carlo Simulation of Asian Option Variance reduction
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
    sigma = 0.15;
    T = 1; 
    cORp = 1; % this is for call option
    tSteps = 20;
    pNum = 100;
    row = 1;
  
    
    disp('Result Interpretation:')
    disp('-----------------------')
    disp('Paths  = Number of path')
    disp('Yb     = Estimation of Arithmetic Average Asian Option Price using variance reduction')
    disp('Y      = Estimation of Arithmetic Average Asian Option without variance reduction')
    disp('CorrXY = Correlation coefficient between X and Y')
    disp('varYb  = variance of Yb')
    disp('varY   = variance of Y')
    disp('Speed  = gain depending on correlation')
    disp(' ')
    
    disp(sprintf('%s', '  Paths          Yb           Y          CorrXY        varYb       varY      Speed' ))
    disp(sprintf('%s', ' ----------    --------     --------     -----------  ---------   --------   ------' ))
    
    while pNum < 10000000
        [Yb, Y, corrXY, varYb, varY, speed] = AsianVarReduction(So, K, r, sigma, T, cORp, tSteps, pNum);
        if row == 1
            disp(sprintf('  %d          %0.6f     %0.6f     %0.6f      %0.6f    %0.6f   %d', pNum, Yb, Y, corrXY, varYb, varY, speed))
        elseif row == 2
            disp(sprintf('  %d         %0.6f     %0.6f     %0.6f      %0.6f    %0.6f   %d', pNum, Yb, Y, corrXY, varYb, varY, speed))   
        elseif row == 3 
            disp(sprintf('  %d        %0.6f     %0.6f     %0.6f      %0.6f    %0.6f   %d', pNum, Yb, Y, corrXY, varYb, varY, speed))   
        elseif row == 4
            disp(sprintf('  %d       %0.6f     %0.6f     %0.6f      %0.6f    %0.6f   %d', pNum, Yb, Y, corrXY, varYb, varY, speed))   
        elseif row == 5 
            disp(sprintf('  %d      %0.6f     %0.6f     %0.6f      %0.6f    %0.6f   %d', pNum, Yb, Y, corrXY, varYb, varY, speed))   
        elseif row == 6
            disp(sprintf('  %d     %0.6f     %0.6f     %0.6f      %0.6f    %0.6f   %d', pNum, Yb, Y, corrXY, varYb, varY, speed))   
        end
        pNum = pNum * 10;
        row = row + 1;
    end
   