function compressionfunc( t,cr,at,rt )
[y, Fs] = audioread(input('BEKSY.mp3 '));


attack_samples = round(at * Fs);
release_samples = round(rt * Fs);

yc = zeros(size(y));
envelope = zeros(size(y));
gain = 1;


for i = 1:length(y)
    
    if abs(y(i)) > envelope(i)
        envelope(i) = abs(y(i));                                     % peak detection
    else
        envelope(i) = envelope(i) - release_samples * (envelope(i) > 0);
    end
    
    
    if envelope(i) > t
        gain = 1 + (t / envelope(i) - 1) / cr;                  % gain reduction
    else
        gain = 1;
    end
    
    
    if i <= attack_samples
        gain = 1 - (1 - gain) * (attack_samples - i + 1) / attack_samples;
    elseif envelope(i) <= t
        gain = 1 + (gain - 1) * (i - attack_samples) / release_samples;
    end
    
    yc(i) = y(i) * gain;
    
end

subplot(2, 1, 1)
plot(y, 'm');
subplot(2, 1, 2)
plot(yc);

sound(yc, Fs);
pause;
clear sound;
end

