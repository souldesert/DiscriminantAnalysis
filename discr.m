load one.txt;
load two.txt;
load three.txt;
twothree = cat(1, two, three);
[F1, A1, isGreater1] = common_average(one, twothree);
disp(F1);
disp(isGreater1);
[F2, A2, isGreater2] = common_average(two, three);
disp(F2);
disp(isGreater2);
load check.txt
disp(check);
checkResult = zeros(size(check, 1), 1);
for i = 1:size(check, 1)
    F = check(i,:) * A1;
    if (F > F1 && isGreater1 == 0) || (F < F1 && isGreater1 == 1)
        checkResult(i) = 1;
    else
        F = check(i,:) * A2;
        if (F > F2 && isGreater2 == 0) || (F < F2 && isGreater2 == 1)
            checkResult(i) = 2;
        else
            checkResult(i) = 3;
        end
    end
end
disp(checkResult);
visualize(one, two, three, check, A1, A2, checkResult);
             