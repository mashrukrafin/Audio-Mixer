function chorusfunc( delay,depth,rate )

[y, Fs] = audioread('BEKSY.mp3');  
  
%chorus 
wetSignal = zeros(size(y)); 
delay_samples = round(delay * Fs);

for n = 1:length(y)
    modulation = depth * sin(2 * pi * rate * n / Fs);
    delay_left = round(delay_samples * (1 + modulation));
    delay_right = round(delay_samples * (1 - modulation)); 

    if delay_left > 0
        delayed_left = y(max(1, n - delay_left), 1);
    else
        delayed_left = y(n, 1);
    end
    
    if delay_right > 0
        delayed_right = y(max(1, n - delay_right), 2);
    else
        delayed_right = y(n, 2);
    end
    
    wetSignal(n, 1) = y(n, 1) + 0.5 * delayed_left;
    wetSignal(n, 2) = y(n, 2) + 0.5 * delayed_right;
end  
  
wetSignal = wetSignal / max(abs(wetSignal(:)));

%plotting
    t = (0:length(y)-1) / Fs;
    subplot(2, 1, 1);
    plot(t, y);
    title('Original Signal');
    xlabel('Time (s)');
    ylabel('Amplitude');

    subplot(2, 1, 2);
    plot(t, wetSignal);
    title('Chorus Signal');
    xlabel('Time (s)');
    ylabel('Amplitude');

sound(wetSignal, Fs);
pause;
clear sound;

end

