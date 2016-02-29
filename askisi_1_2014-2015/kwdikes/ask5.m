function ask5()



%fortwnoume to arxeio kai mas epistrefei ena string
load fearnomore.mat

%vriskoume to alfavito tou keimenou m tin entolh unique ths matlab
B=unique(str);

%metatrepoume to string se ASCII morfh gia na vroume thn pithanothta emfanisis
A = abs(B);

% Ypologismos pithanotitwn emfanisis olwn twn sumbolwn xrisimopoioume thn sunarthsh tis matlab hist gia na ftiaxoume ena istogramma
%
p = hist(A, max(A) - min(A) + 1) / length(A);

% Ypologismos Entropias
Entropy = 0;
for i = (1:max(A) - min(A) + 1)
    if p(i)~=0
    	Entropy = Entropy + p(i)*log2(1/p(i)) ;
    end
end

 % Vriskoume thn pithanotita emfanisis mono gia to alfavito tou keimenou
 C=p(p~=0);

%ektupwnoume ta apotelesmata
d = ['To alfavito tou keimenou tis phhs C einai :' ,num2str(A)];
disp(d);
d = ['======================================================='];
disp(d);

d = ['Kai se morfh ASCII' ,num2str(B)];
disp(d);
d = ['======================================================='];
disp(d);

d = ['H entropia tis phghs     =  ' ,num2str(Entropy)];
disp(d);
d = ['======================================================='];
disp(d);

for i = (1:length(C))
d = ['H pithanotita emfanisis tou sumvolou ' num2str(B(i)) ' einai : '    num2str(C(i))];
disp(d);

d = ['======================================================='];
disp(d);

end