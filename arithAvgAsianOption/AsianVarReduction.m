
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FRE 6251 Numerical and Simulation Techniques in Finance
% Assignment #4
% Name: Surya L Gurung     ID: 0449604
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Yb, Y,corrXY,varYb, varY, speed] = AsianVarReduction(So, K, r, sigma, T, cORp, tSteps, pNum)
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
      
    %closed form solution of geometric average asian option
    EX = geometricAvgOption(So, K, r, sigma, T, cORp);
    
    %matrix of asset paths, each column represents one path    
    stockPaths = AssetPaths(So, r, sigma, T, tSteps, pNum);
    %discounted payoff of arithmetic average asian option
    Yi = exp(-r * T) * max(cORp *(mean(stockPaths)- K), 0);
    %discounted payoff of geometric average asian option
    Xi = exp(-r * T) * max(cORp *(geomean(stockPaths)- K), 0);
         
    %Y is process for arithmetic average
    %X is process for geometric average
    covXY = cov(Xi, Yi); %covariance matrix of X and Y
    covXY = covXY(1,2);
    varX = var(Xi);      % variance of X
    varY = var(Yi);      % varicance of Y
    stdX = sqrt(varX);
    stdY = sqrt(varY);
    
    corrXY = covXY/(stdX * stdY); % correlation between X and Y
    b = covXY/varX;
    
    Yb = mean(Yi - b*(Xi - EX));
    Y = mean(Yi); 
    
    varYb = (varY - 2*b*stdX*stdY*corrXY + b^2*varX)/pNum;
    varY = varY / pNum;
    speed = round(1 /(1- corrXY^2));
    if (pNum < 10000)
        plot(0:T/tSteps:T,stockPaths,'Linewidth',1);
        xlabel('Time Steps to Maturity','FontWeight','bold','Fontsize',16);
        ylabel('Stock Price','FontWeight','bold','Fontsize',16);
        title('Asset Paths Simulation','FontWeight','bold','Fontsize',16);
        grid on
        set(gcf,'Color','w');
    end

    
    