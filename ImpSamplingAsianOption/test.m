a = 0
f = @(x) x^2 - 10 + a

bisection(f, 0, 100, .00001, .0001)
fplot(f, [0, 10])
for i = 1:3
    a = a + 2
    f = @(x) x^2 - 10 + a
    bisection(f, -1, 10, .00001, .0001)
end