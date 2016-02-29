function h = mynoise(x,snr)
SNR = snr ;
    Ps = mean(x.^2);
    sigma = sqrt( Ps/(10^(SNR/10)) );
    N = sigma.*randn(1,length(x));
    h = x + N;
end
