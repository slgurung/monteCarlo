%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FRE 6251 Numerical and Simulation Techniques in Finance
% Name: Surya L Gurung     ID: 0449604
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matrix of asset prices, one column representing one path. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function paths = AssetPaths(So,mu,sigma, T, tSteps,pNum)
% Parameters:
    % So = initial asset price
    % mu = expected return
    % sigma = volatility
    % T = maturity time in years
    % tSteps = number of time steps
    % pNum = number of paths 
    % 
    
    dT = T/tSteps; % size of one time step
    drift = mu - (0.5 * sigma^2);  % drift of process
    z = randn(tSteps, pNum);  % matrix of normally distributed random values
    
    % matrix of all paths
    paths = So*[ones(1,pNum); cumprod(exp(drift*dT + sigma * sqrt(dT)* z),1)];
    
    