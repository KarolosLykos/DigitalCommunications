function sximata()
close all
clear all
clc
% Signal to noise ratio
snr = 0:2:30;



% 8PSK
ber8psk = epsk() ;
ber8psk_channel = epsk_channel() ;

figure(1)
semilogy(snr,ber8psk,'-ob',snr,ber8psk_channel,'-or')
legend('Ideal channel','Non ideal channel')
title('Performance of baseband 8PSK')
xlabel('SNR')
ylabel('BER % ')
grid on

% 8QAM
ber8qam = eqam() ;
ber8qam_channel = eqam_channel() ;

figure(2)
semilogy(snr,ber8qam,'-ob',snr,ber8qam_channel,'-or')
legend('Ideal channel','Non ideal channel')
title('Performance of baseband 8QAM')
xlabel('SNR')
ylabel('BER % ')
grid on

% Ideal channel
figure(3)
semilogy(snr,ber8psk,'-or',snr,ber8qam,'-om')
legend('8PSK','8QAM')
title('Ideal channel')
xlabel('SNR')
ylabel('BER % ')
grid on

% Non ideal channel
figure(4)
semilogy(snr,ber8psk_channel,'-or',snr,ber8qam_channel,'-om')
legend('8PSK','8QAM')
title('Non ideal channel')
xlabel('SNR')
ylabel('BER % ')
grid on

end