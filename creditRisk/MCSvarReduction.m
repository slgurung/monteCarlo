%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FRE 6251 Numerical and Simulation Techniques in Finance
% Assignment #6
% Name: Surya L Gurung     ID: 0449604
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [v] = MCSvarReduction(m, Ci, p, rho, x)
    
    format long g   
    
    xi = norminv(1-p, 0, 1);
    for i = 1:10000
        epsilon = randn(1, m);
        Z = randn(1); 
        pTilda = 1 - normcdf((xi - rho * Z)/sqrt(1 - rho^2)); 
        theta = log(x * (1 - pTilda)/(pTilda * (m - x)));
        theta = max(theta, 0);
        pTheta = (pTilda * exp(theta*Ci))/(pTilda * exp(theta*Ci) + 1 - pTilda);
        L = binornd(m, pTheta);
        cumulant = m * log(pTilda*exp(theta*Ci) + 1 - pTilda);
        indicator = (L > x);
        estimatorWithoutMu(i) = exp(- theta * L + cumulant)* indicator;
   end
   
   v = var(estimatorWithoutMu);
   