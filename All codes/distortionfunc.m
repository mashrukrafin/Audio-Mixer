function distortionfunc( gain )

[y, Fs] = audioread('BEKSY.mp3');

%distortion
y_distorted = y .* (1 + tanh(gain*y));

%plotting
t = (0:length(y)-1) / Fs;  
subplot(2,1,1);
plot(t, y);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(t, y_distorted);
title('Distorted Signal');
xlabel('Time (s)');
ylabel('Amplitude');

sound(y_distorted, Fs);
pause;
clear sound;

end

