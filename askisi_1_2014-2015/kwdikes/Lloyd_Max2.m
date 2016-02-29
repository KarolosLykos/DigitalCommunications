% PCM me mi omoimorfo kvantisti
function [xq,centers,D] = Lloyd_Max(x,N,min_value,max_value)
%x to sima eisodou upo morfh dianismanos
%N o arithmos twn bits pou tha xrisimopoihthoun
%max_value h megisti apodekti timi tou simatos eisodou
%min_value h elaxisti apodekti timi tou simatos eisodou



%xq to kwdikopoihmeno dianusma exodou meta apo Kmax epanalipseis
%centers ta kentra twn perioxwn kvantisis meta apo Kmax epanalipseis
%D dianusma pou periexei tis times [D1:DkmAX] opou Di antstoixei sthn mesh paramorgwsh sthn i-osth epanalhpsh tou algorithmou



% mhkos tou dianusmatos x
l = length(x) ;

count = 1;

% Arxikopoihsh  twn oriwn kvantismou me ta kentra tou omoiomorfou kvantisti 
[xq_tmp,centers_tmp] = my_quantizer(x,N,min(x),max_value) ;

% Ypologismos elaxistis timis simatos eisodou
%upologismos megistis timis simatos eisodou
min_value = min(x);


% Arxikopoihsh dianusmatwn
 s = zeros(1,2^N) ;
 n=zeros(1,2^N) ;
 upper = zeros(1,2^N) ;
 lower = zeros(1,2^N) ;
 
 % Ypologismos isxus tous simatos eisodou x
 power = mean(x.^2);

 % Megisto kai elaxisto orio tou simatos eisodou
for i = 1:l
if x(i)> max_value
    x(i) = max_value ;
elseif x(i) < min_value
    x(i) =min_value ;
end
end

 loop = 0;
 while loop~=1
    
for k = 1: 2^N
    %elegxoume se poia perioxi tou sima eimaste wste na vroume tin megisti kai elaxisti timi tou simatos
    %An eimaste stin prwth tote to anw orio einai to max_value tou simatos
     if k == 1 
        upper(k) = max_value ;
        lower(k) = (centers_tmp(k) + centers_tmp(k+1) )/2 ;
    %An eimaste stin teleutaia tote to katw orio einai to min_value tou simatos
     elseif k==2^N
         upper(k) = (centers_tmp(k-1) + centers_tmp(k) )/2 ;
         lower(k) = min_value ;
    %Stis upoloipes periptwseis vriskoume to orio upologizontas me thn vohtheia twn duo geitonikwn perioxwn
     else
         upper(k) = (centers_tmp(k-1) + centers_tmp(k) )/2 ;
         lower(k) = (centers_tmp(k) + centers_tmp(k+1) )/2 ;
     end
    
  
 %% O algorithmos Lloyd Max
    for i = 1:l
        
       if x(i) >= lower(k) &&  x(i) <=upper(k) 
%upologizoume tin timi tou simatos exodou upologizontas to kvantismeno sima eisodou


               xq_tmp(i) = k ;
 % Voithitika dianusmata gia ton upologismo tou
 % mesou orou twn timwn eisodou se kathe perioxi
              s(k) = s(k) + x(i) ;
              n(k) = n(k)+1 ;
       end
       
    end
 
 % Ean uparxei toulaxiston mia timi mesa stin perioxi
 % ypologizoume to neo kentroeides ws ton meso oro
 % aftwn twn timwn
 
    if n(k) ~= 0
        centers_tmp(k) = s(k)/n(k) ;
    else 
 % alliws to kentroeides paramenei opws itan
        centers_tmp(k) = (upper(k)+lower(k)) /2 ;
        
    end
    
end
% Ypologismos kvantismenou simatos
 x_new = centers_tmp(xq_tmp);

 % Ypologismos paramorfwsis gia kathe epanalipsi tou algorithmou
 Dis(count)= mean((x-x_new').^2) ;
 % Ypologismos thoruvou tou kvantismenou simatos
 noise = mean((x-x_new').^2);
 
 % Ypologismos SQNR gia kathe epanalipsi tou algorithmou
 SQNR(count) = power/noise;
  % Ypologismos SQNR se db
 SQNRdb(count) = 10*log10(SQNR(count));

 % Ean den vriskomaste stin prwti epanalipsi
 % kai h diafora tis paramorfwshs tou neou kvantismenou simatos
 % apo to to kvantismeno sima tis proigoumenis epanalipsis
 % einai mikroteri tou katwfliou 10^-7 termatizei o algorithmos
 if count ~= 1 && Dis(count-1)-Dis(count) <10^-7
     loop =1;
 end
 
  count = count +1 ;
 end

% Ta dianusmata eksodou pairnoun tis times twn dianusmatwn stin 
% teleftaia epanalipsi tou algorithmou
xq = xq_tmp ;
centers = centers_tmp ;

% Ypologismos paramorfwsis stin teleftaia epanalipsi
D = Dis(length(Dis)) ;

% Grafikh parastash SQNR (db) gia oles tis epanalipseis
figure(N)
plot(SQNRdb,'-b','LineWidth',2);
title(['Arithmos bits kvantisis = ',num2str(N),' bits'])
ylabel('SQNR_d_b')
xlabel('epanalipseis')
grid on



end