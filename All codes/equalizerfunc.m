function equalizerfunc( cutoff_freq,gain )

[y, Fs] = audioread('BEKSY.mp3');

%Equalizer
[b, a] = cheby1(4, 0.5, cutoff_freq/(Fs/2), 'low');
y_equalized = zeros(size(y));

for i = 1:size(y, 2)
    y_equalized(:, i) = filter(b, a, y(:, i));
end

y_equalized = y_equalized * 10^(gain/20);
y_equalized = y_equalized / max(abs(y_equalized(:)));

%plotting
    t = (0:length(y)-1) / Fs;  
    subplot(2, 1, 1);
    plot(t, y);
    title('Original Signal');
    xlabel('Time (s)');
    ylabel('Amplitude');

    subplot(2, 1, 2);
    plot(t, y_equalized);
    title('Equalized Signal');
    xlabel('Time (s)');
    ylabel('Amplitude');

sound(y_equalized, Fs);
pause;
clear sound;

end

