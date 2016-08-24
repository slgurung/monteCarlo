
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FRE 6251 Numerical and Simulation Techniques in Finance
% Assignment #6
% Name: Surya L Gurung     ID: 0449604
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [E_mu, v1] = ExpoTilting(m, Ci, p, rho,mu, x)
    
    format long g   
        
    xi = norminv(1-p, 0, 1);
    for i = 1:100000
        epsilon = randn(1, m);
        Z = normrnd(mu, 1); 
        %Xi = rho * Z + sqrt(1 - rho^2) * epsilon;
        pTilda = 1 - normcdf((xi - rho * Z)/sqrt(1 - rho^2)); 
        theta = log(x * (1 - pTilda)/(pTilda * (m - x)));
        theta = max(theta, 0);
        pTheta = (pTilda * exp(theta*Ci))/(pTilda * exp(theta*Ci) + 1 - pTilda);
        L = binornd(m, pTheta);
        cumulant = m * log(pTilda*exp(theta*Ci) + 1 - pTilda);
        indicator = (L > x);
        estimatorWithMu(i) = exp(-mu*Z + 0.5 * mu^2 - theta * L + cumulant)* indicator;
   end
   
   E_mu = mean(estimatorWithMu);
   v1 = var(estimatorWithMu);
   