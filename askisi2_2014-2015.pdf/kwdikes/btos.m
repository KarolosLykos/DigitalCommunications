% Binary to symbols
function [s] = btos(b)

% 4PAM
count =1 ;
for i = 1:2:length(b)
    if b(i) == 0 && b(i+1)==0
        s(count) = -3/sqrt(5);
    elseif b(i) == 0 && b(i+1)==1
        s(count) = -1/sqrt(5);
    elseif b(i) == 1 && b(i+1) == 0
        s(count) = 1/sqrt(5);
    elseif b(i) == 1 && b(i+1) == 1
        s(count) = 3/sqrt(5);
    end
    count = count+1;

end