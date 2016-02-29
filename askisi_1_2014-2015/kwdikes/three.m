function three()
 clear all
 clc
 close all
 % Fortwsh toy dianusmatos fwnis
[y,~,~]=wavread('speech.wav');
% Ektelesh omoiomorfis kvantisis me 2 bits
[xq,centers] = my_quantizer(y,2,min(y),max(y));
% Ypologismos Delta
D = (max(y)-min(y))/2^2 ;
% Mesi timi kai apoklisi
m = -0.04;
d = sqrt(0.11);
% d = 0.11;
% Ypologismos oriwn 
lim1 = max(y) - D;
lim2 = max(y) - 2*D;
lim3 = max(y) - 3*D;
lim4 = inf;
% Sunarthsh puknotitas pithanotitas
p4 = normcdf(lim3,m,d) 
p3 = normcdf(lim2,m,d) - p4
p2 = normcdf(lim1,m,d) -p3-p4
p1 = normcdf(lim4,m,d) -p2-p3-p4
% Anathesi timwn se ena dianusma
p_theoretical = [p1 p2 p3 p4]

% Ypologismos peiramatikwn timwn
% gia sunarthsh puknotitas pithanotitas
 p_expiramental = hist(xq, max(xq) - min(xq) + 1) / length(xq) 
 % dianusma me tis perioxes
s = [1 2 3 4];
 
% Sxediasi grafikwn parastasewn
 plot(s,p_theoretical,'-ob',s,p_expiramental,'-or')
 title('Theoretical vs Experimental cdf')
%  legend('theoretical','experimental')
 hleg1 = legend('theoretical','experimental');
 xlabel('stathmes')
 ylabel('pithanotita emfanisis')
 grid on
end