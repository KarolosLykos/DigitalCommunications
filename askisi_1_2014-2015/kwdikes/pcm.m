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
ena = centers;





B=4;
[xq,centers,D] = Lloyd_Max(y,B,min(y),max(y));
% Ypologismos kvantismenou simatos
xq1 = centers(xq) ;
% Ypologismos thoruvou
noise = mean((y-xq1').^2);
% Ypologismos Signal to Noise Ratio
SQNR = power/noise ;
% Ypologismos Signal to Noise Ratio se decibel (dB) 
SQNRdb_a_2 = 10*log10(SQNR);
%wavplay(xq1,fs);
duo = centers;


B=8;
[xq,centers,D] = Lloyd_Max(y,B,min(y),max(y));
% Ypologismos kvantismenou simatos
xq1 = centers(xq) ;
% Ypologismos thoruvou
noise = mean((y-xq1').^2);
% Ypologismos Signal to Noise Ratio
SQNR = power/noise ;
% Ypologismos Signal to Noise Ratio se decibel (dB) 
SQNRdb_a_3 = 10*log10(SQNR);
%wavplay(xq1,fs);

tria= centers;

d = ['SQNRdb ',' unnormalized quantizer ','2 bits  =  ' ,num2str(SQNRdb_a_1)];
disp(d);
d = ['SQNRdb ',' unnormalized quantizer ','4 bits  =  ' ,num2str(SQNRdb_a_2)];
disp(d);
d = ['SQNRdb ',' unnormalized quantizer ','8 bits  =  ' ,num2str(SQNRdb_a_3)];
disp(d);
