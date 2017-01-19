function visualize(one, two, three, check, A1, A2, checkResult)
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
X1 = I == I1;
X2 = I == I2;
%axis equal;
grid on;
hold on;
for i = 1:size(check,1)
    if checkResult(i) == 1
        marker = '*b';
    elseif checkResult(i) == 2
        marker = 'xg';
    else
        marker = '+m';
    end
    plot(check(i, X1), check(i, X2), marker);
    hold on;
end
ylim([0,3]);
figure;
for i = 1:size(check,1)
    F1 = 0;
    F2 = 0;
    for j = 1:size(check, 2)
        F1 = F1 + check(i, j) * A1(j);
        F2 = F2 + check(i, j) * A2(j);
    end
    if checkResult(i) == 1
        marker = '*b';
    elseif checkResult(i) == 2
        marker = 'xg';
    else
        marker = '+m';
    end
    plot(F1, F2, marker);
    hold on;
end

    