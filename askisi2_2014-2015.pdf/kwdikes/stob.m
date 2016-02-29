
% Symbols to binary
function [b] = stob(s)

% 4PAM
for i = 1:length(s)
    if s(i) == -3/sqrt(5)
        b(2*i -1) = 0;
        b(2*i) = 0;
    elseif s(i) == -1/sqrt(5)
        b(2*i -1) = 0;
        b(2*i) = 1;
    elseif s(i) == 1/sqrt(5)
        b(2*i -1) = 1;
        b(2*i) = 0;
    elseif s(i) == 3/sqrt(5)
        b(2*i -1) = 1;
        b(2*i) = 1;
    end

    
end