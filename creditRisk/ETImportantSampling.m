%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FRE 6251 Numerical and Simulation Techniques in Finance
% Assignment #6
% Name: Surya L Gurung     ID: 0449604
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Parameter Description:
    
    % m = number of obligor in a portfolio 
    % Ci = credit exposure
    % p = original default portfolio  
    % rho = correlation coefficient 
    % x = default threshold
    
    
    %-----------
    % Example 1:
    %----------- 


m = 1000;
Ci = 1;
p = 0.002;
rho = 0.05;
x = 6;
mu = [0, 0.5, 1, 1.5, 2, 2.25, 2.5, 2.75, 3, 3.5, 4];

disp(sprintf('%s', '  rho       x      P(L > x)' ))
disp(sprintf('%s', ' ------   ------   ---------' ))

for i= 1:length(mu)
    [E_mu(i), v1(i)] = ExpoTilting(m, Ci, p, rho, mu(i), x);
end
disp(sprintf('  %0.2f      %d      %0.6f', rho, x, mean(E_mu)))
rho = 0.1;
x = 6;
for i= 1:length(mu)
    [E_mu(i), v1(i)] = ExpoTilting(m, Ci, p, rho, mu(i), x);
end
disp(sprintf('  %0.2f      %d      %0.6f', rho, x, mean(E_mu)))
rho = 0.25;
x = 10;
for i= 1:length(mu)
    [E_mu(i), v1(i)] = ExpoTilting(m, Ci, p, rho, mu(i), x);
end
disp(sprintf('  %0.2f      %d     %0.6f', rho, x, mean(E_mu)))
v3 = MCSvarReduction(m, Ci, p, rho, x);
vReductionFactors = v3./v1;
plot(mu, vReductionFactors,'Linewidth',1)
xlabel('\mu,   for \sigma = 0.25','FontWeight','bold','Fontsize',14);
ylabel('Variance Reduction Factor','FontWeight','bold','Fontsize',14);
title('Importance Sampling for Credit Loss','FontWeight','bold','Fontsize',14);

rho = 0.5;
x = 26;
for i= 1:length(mu)
    [E_mu(i), v1(i)] = ExpoTilting(m, Ci, p, rho, mu(i), x);
end
disp(sprintf('  %0.2f      %d     %0.6f', rho, x, mean(E_mu)))
rho = 0.8;
x = 43;
for i= 1:length(mu)
    [E_mu(i), v1(i)] = ExpoTilting(m, Ci, p, rho, mu(i), x);
end
disp(sprintf('  %0.2f      %d     %0.6f', rho, x, mean(E_mu)))