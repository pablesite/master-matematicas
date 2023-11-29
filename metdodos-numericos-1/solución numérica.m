format long

x = (-10:0.00001:10);
f = @(x) x - exp(-x);
y = 0;
err = zeros(1,length(x));
for i = 1:length(x)
    err(i) = abs(f(x(i)));
%     y = f(x(i));
end

plot(err);

[sol, index] = min(err);

res = x(index)

