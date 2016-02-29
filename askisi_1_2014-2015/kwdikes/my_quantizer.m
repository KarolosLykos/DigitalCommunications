function [xq,centers] = my_quantizer(x,N,min_value,max_value)

%x to sima eisodou upo morfh dianismanos
%N o arithmos twn bits pou tha xrisimopoihthoun
%max_value h megisti apodekti timi tou simatos eisodou
%min_value h elaxisti apodekti timi tou simatos eisodou



%xq to kwdikopoihmeno dianusma exodou
%centers ta kentra twn perioxwn kvantisis




 
% mhkos tou dianusmatos x
l = length(x) ;

% Ypologismos Delta (vima kvantismou)
Delta = (max_value-min_value)/(2^N) ;

% Arxikopoihsh dianusmatwn
xq = zeros(1,l) ;
centers = zeros(1,2^N) ;

%Oria dunamikhs perioxis tou simatos eisodou 
%max_value einai to max tou simatos eisodou
%min_value einai to min tou simatos eisodou


for i = 1:l
  if x(i)> max_value

     x(i) = max_value ;

  elseif x(i) < min_value

    x(i) = min_value ;

  end
end


% Ylopoihsh algorithmou omoiomorfou kvantisti
for i = 1 : l 
       
    for k = 1: 2^N
        
% Ypologismos oriwn kathe perioxis 
%Vriskoume to anw kai katw orio kathe perioxis me to vima kvantismou  
         up =  max_value - (k-1)*Delta ;
          down = max_value -k*Delta ;
          
%Vriskoume to kentro kathe perioxis      
          centers(k) = (up+down)/2 ;

% Ypologismos tou kwdikopoihmenou simatos exodou       
          if x(i) >= down &&  x(i) <=up
          xq(i) = k ;
           end
      
  
    end

end

end