
%fortwnoume to hxitiko sima
[y,fs,N]=wavread('speech.wav');
%y to sima hxou pou exoume fortwsei apo to speech.wav
%fs o ruthmos deigmatolipsias
%N ta kvantismena bits



%wavplay(y,fs);

power = mean(y.^2) ;
B=2;
[xq,centers,D] = Lloyd_Max(y,B,min(y),max(y));

% Ypologismos Delta
Del = (max(y)-min(y))/2^2 ;

% Mesi timi kai apoklisi
m = -0.04;

d = sqrt(0.11);


% Ypologismos oriwn 
orio1 = max(y) - Del;
orio2 = max(y) - 2*Del;
orio3 = max(y) - 3*Del;
orio4 = inf;

% Sunarthsh puknotitas pithanotitas
p4 = normcdf(orio3,m,d) ;
p3 = normcdf(orio2,m,d) - p4;
p2 = normcdf(orio1,m,d) -p3-p4;
p1 = normcdf(orio4,m,d) -p2-p3-p4;

% Anathesi timwn se ena dianusma
theoritiki_pithanotita = [p1 p2 p3 p4];

% Ypologismos peiramatikwn timwn
% gia sunarthsh puknotitas pithanotitas
 peiramatiki_pithanotita = hist(xq, max(xq) - min(xq) + 1) / length(xq) ;
 % dianusma me tis perioxes
s = [1 2 3 4];

 

