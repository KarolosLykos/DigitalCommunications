function h = mynoise_complex(x,snr)
SNR = snr ;
    Ps = mean(x.^2);
    sigma = sqrt( Ps/(10^(SNR/10)) );
    N = sigma.*randn(1,length(x))/sqrt(2) + imag((sigma.*rand(1,length(x))/sqrt(2)));
    h = x + N;

end