m = 1000;
for i = 1: 1000000
    L(i) = binornd(m, 0.002);
end
var(L)