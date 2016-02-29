function [s] = btoq(b)

% 4QAM
count =1 ;
for i = 1:2:length(b)
    if b(i) == 0 && b(i+1)==0
        s(count) = (-1-1i)/sqrt(2);
    elseif b(i) == 0 && b(i+1)==1
        s(count) = (-1+1i)/sqrt(2);
    elseif b(i) == 1 && b(i+1) == 0
        s(count) = (1-1i)/sqrt(2);
    elseif b(i) == 1 && b(i+1) == 1
        s(count) = (1+1i)/sqrt(2);
    end
    count = count+1;


end