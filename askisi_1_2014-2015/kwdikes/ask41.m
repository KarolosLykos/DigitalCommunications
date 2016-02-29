%fortwnoume to hxitiko sima
[y,fs,N]=wavread('speech.wav');
%y to sima hxou pou exoume fortwsei apo to speech.wav
%fs o ruthmos deigmatolipsias
%N ta kvantismena bits



%wavplay(y,fs);

power = mean(y.^2) ;
B=2;
[xq,centers,D] = Lloyd_Max(y,B,min(y),max(y));
% Ypologismos kvantismenou simatos
xq1 = centers(xq) ;
% Ypologismos thoruvou
noise = mean((y-xq1').^2);
% Ypologismos Signal to Noise Ratio
SQNR = power/noise ;
% Ypologismos Signal to Noise Ratio se decibel (dB) 
SQNRdb_a_1 = 10*log10(SQNR);
%wavplay(xq1,fs);

p = hist(xq1, 127 - 32 + 1) / length(xq1) ;
  
  % Ypologismos Entropias
 Entropy1 = 0;
for i = 1:96
    if p(i)~=0
    Entropy1 = Entropy1 + p(i)*log2(1/p(i)) ;
    end
end





B=4;
[xq,centers,D] = Lloyd_Max(y,B,min(y),max(y));
% Ypologismos kvantismenou simatos
xq1 = centers(xq) ;

p = hist(xq1, 127 - 32 + 1) / length(xq1) ;
  
  % Ypologismos Entropias
 Entropy2 = 0;
for i = 1:96
    if p(i)~=0
    Entropy2 = Entropy2 + p(i)*log2(1/p(i)) ;
    end
end


B=8;
[xq,centers,D] = Lloyd_Max(y,B,min(y),max(y));
% Ypologismos kvantismenou simatos
xq1 = centers(xq) ;



 p = hist(xq1, 127 - 32 + 1) / length(xq1) ;
  
  % Ypologismos Entropias
 Entropy3 = 0;
for i = 1:96
    if p(i)~=0
    Entropy3 = Entropy3 + p(i)*log2(1/p(i)) ;
    end
end