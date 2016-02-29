function [b] = qtob(s)

% 4QAM
for i = 1:length(s)
    if s(i) == (-1-1i)/sqrt(2)
        b(2*i -1) = 0;
        b(2*i) = 0;
    elseif s(i) == (-1+1i)/sqrt(2)
        b(2*i -1) = 0;
        b(2*i) = 1;
    elseif s(i) == (1-1i)/sqrt(2)
        b(2*i -1) = 1;
        b(2*i) = 0;
    elseif s(i) == (1+1i)/sqrt(2)
        b(2*i -1) = 1;
        b(2*i) = 1;
    end


end