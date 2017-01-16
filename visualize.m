function visualize(one, two, three, check, A1, A2)
%load one.txt
%load two.txt
%load three.txt
all = cat(1, one, two, three);
N1 = size(one, 1);
N2 = size(two, 1);
N3 = size(three, 1);
N = size(all, 1);
X1 = mean(one);                     % average variables in 1st group
X2 = mean(two);                     % average variables in 2nd group
X3 = mean(three);                   % average variables in 3rd group
X = mean(all);                      % average variables
for j = 1:size(all, 2)
    denom = 0;                          % denominator
    for i = 1:size(all, 1)
        denom = denom + (all(i, j) - X(j))^2;       
    end
    num = N1 * (X1(j) - X(j))^2;
    num = num + N2 * (X2(j) - X(j))^2;
    num = num + N3 * (X3(j) - X(j))^2;      % numerator
    I(j,:) = num / denom;
end
Isorted = sort(I);
disp(Isorted);
I1 = Isorted(end);
I2 = Isorted(end - 1);
X1 = find(I == I1);
X2 = find(I == I2);
one2d(:, 1) = one(:, X1);
one2d(:, 2) = one(:, X2);
two2d(:, 1) = two(:, X1);
two2d(:, 2) = two(:, X2);
three2d(:, 1) = three(:, X1);
three2d(:, 2) = three(:, X2);
check2d(:, 1) = check(:, X1);
check2d(:, 2) = check(:, X2);
axis equal;
grid on;
hold on;
for i = 1:size(one2d,1)
    plot(one2d(i, 1), one2d(i, 2), '*b');
end
for i = 1:size(two2d,1)
    plot(two2d(i, 1), two2d(i, 2), 'xg');
end
for i = 1:size(three2d,1)
    plot(three2d(i, 1), three2d(i, 2), '+m');
end
for i = 1:size(check2d,1)
    plot(check2d(i, 1), check2d(i, 2), 'or');
end
K1 = - A1(X1) / A1(X2);
K2 = - A2(X1) / A2(X2);
values = [-20 50];
F1 = K1 * values;
F2 = K2 * values;
plot(values, F1);
plot(values, F2);

    