N=256;
M=256;

load cameraman.mat
imshow(uint8(i));



x=i(:);
x=(x-128)/128;

power = mean(x.^2) ;

p = hist(x, 127 - 32 + 1) / length(x) ;
  
  % Ypologismos Entropias
 Entropy21 = 0;
for i = 1:96
    if p(i)~=0
    Entropy21 = Entropy21 + p(i)*log2(1/p(i)) ;
    end
end

[xq,centers,D]=Lloyd_Max(x,2,min(x),max(x));

a1=centers(xq);
a2=128*a1+128;
y1=reshape(a2,M,N);
imshow(uint8(y1));

p = hist(a2, 127 - 32 + 1) / length(a2) ;
  
  % Ypologismos Entropias
 Entropy22 = 0;
for i = 1:96
    if p(i)~=0
    Entropy22 = Entropy22 + p(i)*log2(1/p(i)) ;
    end
end


[xq,centers,D]=Lloyd_Max(x,4,min(x),max(x));

a3=centers(xq);
a4=128*a3+128;
y2=reshape(a4,M,N);
imshow(uint8(y2));

p = hist(a3, 127 - 32 + 1) / length(a3) ;
  
  % Ypologismos Entropias
 Entropy23 = 0;
for i = 1:96
    if p(i)~=0
    Entropy23 = Entropy23 + p(i)*log2(1/p(i)) ;
    end
end



