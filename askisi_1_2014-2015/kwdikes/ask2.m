N=256;
M=256;

load cameraman.mat
imshow(uint8(i));



x=i(:);
x=(x-128)/128;

power = mean(x.^2) ;

[xq,centers,D]=Lloyd_Max(x,2,min(x),max(x));

a1=centers(xq);
a2=128*a1+128;
y1=reshape(a2,M,N);
imshow(uint8(y1));

noise = mean((x-a1').^2);
% Ypologismos Signal to Noise Ratio
SQNR = power/noise ;
% Ypologismos Signal to Noise Ratio se decibel (dB) 
SQNRdb_a_1 = 10*log10(SQNR);


[xq,centers,D]=Lloyd_Max(x,4,min(x),max(x));

a3=centers(xq);
a4=128*a3+128;
y2=reshape(a4,M,N);
imshow(uint8(y2));

noise = mean((x-a3').^2);
% Ypologismos Signal to Noise Ratio
SQNR = power/noise ;
% Ypologismos Signal to Noise Ratio se decibel (dB) 
SQNRdb_a_2 = 10*log10(SQNR);



d = ['SQNRdb ',' unnormalized quantizer ','2 bits  =  ' ,num2str(SQNRdb_a_1)];
disp(d);
d = ['SQNRdb ',' unnormalized quantizer ','4 bits  =  ' ,num2str(SQNRdb_a_2)];
disp(d);

