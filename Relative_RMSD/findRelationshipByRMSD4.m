function findRelationshipByRMSD
A = xlsread('data.xlsx', 1);
B = xlsread('data.xlsx', 2);
% Following lines for testing, don't pay more attention.
% A = [1,2,1,2,1];
% B = [3,4,3,4,3];
% B = [B;B];
% B(2,3) = 5;
% A = repmat(A, 2, 1);
% C = repmat(A, 4, 1);
% disp(C)
% disp(A)
compare(A, B)

% This function cannot be modified as it is at the top-level.
function relationship = compare(A, B)
A = superimpose(A);
B = superimpose(B);
comp = zeros(size(B,1),1);
for i = 1:size(B,1)
    line = B(i,:);
    comp(i) = getRMSD(line, A);
    % output & have a look
    disp(['time', num2str(i)])
    disp(comp(i))
end
relationship = mean(comp);

% Pre-processing: each value of a row subtracts the-row-mean, followed by normalizing
function m = superimpose(m)
m = (m - mean(m, 2)) ./ sqrt(sum(m .^ 2, 2));

% This function is to get the similarity between each row of Sample-B and the Sample-A population rows.
function rslt = getRMSD(linetest, template)
comprslt = zeros(size(template,1),1);
for i = 1:size(template,1)
    linetpl = template(i,:);
    linerslt = RMSD(linetpl, linetest);
    comprslt(i) = mean(linerslt);
end
rslt = min(comprslt);

function rmsd = RMSD(tpl, test)
rmsd = sqrt(mean((tpl - test) .^ 2));
