function reverbfunc( time,decay,wet )

[y, Fs] = audioread('BEKSY.mp3');

%parameters
delayTime = time / 4;

delayTimes = delayTime * [0.5, 0.6, 0.7, 0.8];
y_reverb = zeros(size(y));

%reverb
for i = 1:length(delayTimes)
    delaySamples = round(delayTimes(i) * Fs);
    y_delayed = [zeros(delaySamples, size(y, 2)); y(1:end-delaySamples, :)];
    
    decayed_delayed = decay * y_delayed; 
    y_reverb = y_reverb + decayed_delayed; 
end

y_reverb = wet * y_reverb + (1 - wet) * y;
y_reverb = y_reverb / max(abs(y_reverb(:)));

%plotting

    t_orig = (0:length(y)-1) / Fs;
    subplot(2, 1, 1);
    plot(t_orig, y);
    title('Original Signal');
    xlabel('Time (s)');
    ylabel('Amplitude');

    t_reverb = (0:length(y_reverb)-1) / Fs;
    subplot(2, 1, 2);
    plot(t_reverb, y_reverb);
    title('Reverb Signal');
    xlabel('Time (s)');
    ylabel('Amplitude');

sound(y_reverb, Fs);
pause;
clear sound;
end

