function testfindhorizontal
A = xlsread('data.xlsx');
x = A(:, 1);
y = A(:, 2);
plot(x, y)
ythreshold = 0.05;  %threshold
num = 100; %reference line numbers
rmsds = zeros(1, num);
yrefs = linspace(min(y), max(y), num);
for i = 1:num
    yref = yrefs(i);
    xselindex = x(abs(y - yref) < ythreshold);
    downlimit = min(xselindex);
    uplimit = max(xselindex);
    rmsd = rms(yref-y(downlimit:uplimit));
    rmsds(i) = rmsd;
    line([downlimit, uplimit], [yref, yref])
    text(uplimit, yref, num2str(rmsd))
end
[rmsd, i] = min(rmsds);
yref = yrefs(i);
xselindex = x(abs(y - yref) < ythreshold);
downlimit = min(xselindex);
uplimit = max(xselindex);
line([downlimit, uplimit], [yref, yref], 'color', 'r', 'linewidth', 2)
text(uplimit, yref, num2str(rmsd))
B = [x(downlimit:uplimit) y(downlimit:uplimit)];
xlswrite('data.xlsx', B, 2)