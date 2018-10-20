% Richard Gooding/ Thomas Devries/ Jose Lopez
% finding a new pivot point of larger value
%---------------------------------------------------------------
function [i, j] = findRookPivot(A)
found = false; % begining search
j = 1;

while ~ found 
    [big, i] =  max(abs(A(:, j))); % searching first column for largest value
    [p, k] = max(abs(A(i,:))); % finding largest values in row of largest cloumn value
    if p <= big 
        found = true;
    else 
    j = k;
    end
end
end
 


