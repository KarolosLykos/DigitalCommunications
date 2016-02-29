function [ s ] = foratis(r,epilogh)


% 8PSK symbols
if epilogh == 1

sym = [-3/sqrt(5) -1/sqrt(5) 1/sqrt(5) 3/sqrt(5)] ;
s = zeros(1,length(r)) ;
for i = 1: length(r)

    d(1) = (r(i) - sym(1)).^2 ;
    d(2) = (r(i) - sym(2)).^2 ;
    d(3)= (r(i) - sym(3)).^2 ;
    d(4) = (r(i) - sym(4)).^2 ;
    
    m = min(d);
    if m==d(1)
        s(i) = sym(1);
    elseif m==d(2)
        s(i) = sym(2);
        elseif m==d(3)
        s(i) = sym(3);
    else
        s(i) = sym(4);

    end
end
end

% 8QAM symbols 
if epilogh == 2

sym = [(-1-1i)/sqrt(2) (-1+1i)/sqrt(2) (1-1i)/sqrt(2) (1+1i)/sqrt(2)] ;
s = zeros(1,length(r)) ;
for i = 1: length(r)

    d(1) = (r(i) - sym(1)).^2 ;
    d(2) = (r(i) - sym(2)).^2 ;
    d(3)= (r(i) - sym(3)).^2 ;
    d(4) = (r(i) - sym(4)).^2 ;
    
    m = min(d);
    if m==d(1)
        s(i) = sym(1);
    elseif m==d(2)
        s(i) = sym(2);
        elseif m==d(3)
        s(i) = sym(3);
    else
        s(i) = sym(4);

    end
end
end

end