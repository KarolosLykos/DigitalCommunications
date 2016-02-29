N=2;
[y,fs,N]=wavread('speech.wav');
y2=interp(y,N); 


[cn]=adm_enc(y2);
[signal]=adm_dec(cn);
figure(1)
subplot(3,1,1)
plot(signal)
title(['Arithmos bits kvantisis = ',num2str(N),' bits'])
ylabel('')
xlabel('')
grid on

N=4;
y2=interp(y,N); 
[cn]=adm_enc(y2);
[signal]=adm_dec(cn);

subplot(3,1,2)
plot(signal)
title(['Arithmos bits kvantisis = ',num2str(N),' bits'])
ylabel('')
xlabel('')
grid on




N=8;
y2=interp(y,N); 
[cn]=adm_enc(y2);
[signal]=adm_dec(cn);

subplot(3,1,3)
plot(signal)
title(['Arithmos bits kvantisis = ',num2str(N),' bits'])
ylabel('')
xlabel('')
grid on


