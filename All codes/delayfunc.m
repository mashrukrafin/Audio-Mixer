function delayfunc( delaytime )

[y, Fs] = audioread('BEKSY.mp3');
delaySamples = round(delaytime * Fs);

%delay
y_delayed = [zeros(delaySamples, size(y, 2)); y(1:end-delaySamples, :)];
y_combined = y + y_delayed;

%plotting
t_orig = (0:length(y)-1) / Fs;
subplot(3, 1, 1);
plot(t_orig, y);
title('Original Audio');
xlabel('Time (s)');
ylabel('Amplitude');

t_delayed = (0:length(y_delayed)-1) / Fs; 
subplot(3, 1, 2);
plot(t_delayed, y_delayed);
title('Delayed Audio');
xlabel('Time (s)');
ylabel('Amplitude');

t_combined = (0:length(y_combined)-1) / Fs;  % Time vector for combined audio
subplot(3, 1, 3);
plot(t_combined, y_combined);
title('Combined Audio');
xlabel('Time (s)');
ylabel('Amplitude');

sound(y_combined, Fs);
pause;
clear sound;

end

