
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FRE 6251 Numerical and Simulation Techniques in Finance
% Assignment #5
% Name: Surya L Gurung     ID: 0449604
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Y, error1] = ImportanceSampling(So, K, r, sigma, T, cORp, tSteps, pNum)
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
    %matrix of asset paths, each column represents one path    
    [stockPaths, mu, Z] = MuAssetPaths(So, K, r, sigma, T, tSteps, pNum);
    %discounted payoff of arithmetic average asian option
    Gz = exp(-r * T) * max(cORp *(mean(stockPaths)- K), 0);
    Yi = Gz * exp(-mu' * Z +0.5 * mu' * mu);
    Y = mean(Yi);
    error1 = 1.96 * (std(Yi)/sqrt(pNum));
    if (pNum == 10000)
        plot(0:T/tSteps:T,stockPaths,'Linewidth',1);
        xlabel('Time Steps to Maturity','FontWeight','bold','Fontsize',16);
        ylabel('Stock Price','FontWeight','bold','Fontsize',16);
        title('Asset Paths Simulation','FontWeight','bold','Fontsize',16);
        grid on
        set(gcf,'Color','w');
    end

    
    
    