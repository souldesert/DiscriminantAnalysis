function [F, A, isGreater] = common_average(one, two)
S1 = cov(one, 1);                   % normalized by the number of observations
S2 = cov(two, 1);
N1 = size(one, 1);
N2 = size(two, 1);
S = 1 / (N1 + N2 - 2) * (N1 * S1 + N2 * S2);
X1 = mean(one);
X2 = mean(two);
A = S \ (X1' - X2');
for i = 1:N1
    F1(i,:) = one(i,:) * A;
end
for i = 1:N2
    F2(i,:) = two(i,:) * A;
end
F = (mean(F1) + mean(F2)) / 2;
isGreater = 0;
if mean(F2) > F
    isGreater = 1;                  % 1 if F2 is greater than average
end                    