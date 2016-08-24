%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FRE 6251 Numerical and Simulation Techniques in Finance
% Assignment #5
% Name: Surya L Gurung     ID: 0449604
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [zero, it] = bisection(fn,a, b, hTol, vTol)
    
    m = (a+b)/2;
    xTol = 1;
    yTol = 1;
    iteration = 0;
    if sign(fn(a)) ~= sign(fn(b))
        while xTol > hTol & yTol > vTol
            if sign(fn(m)) == 0
                xTol = 0;
                yTol = 0; 
            else
                if sign(fn(a)) == sign(fn(m))
                    a = m;
                else
                    b = m;
                end
                xTol = abs(b - a);
                yTol = abs(fn(b) - fn(a));
            end
            m = (a+b)/2;
            iteration = iteration + 1;
        end
        zero = m;
        it = iteration;
    else  
        zero = 'Limits are not appropriate.';
        it = 0;
    end