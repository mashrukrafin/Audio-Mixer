function playbackspeedfunc( speedfactor )

[y, Fs] = audioread('BEKSY.mp3');
newFs = speedfactor * Fs;

%plotting
t = (0:length(y)-1) / Fs; 
subplot(2,1,1);
plot(t, y);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');

t = (0:length(y)-1) / newFs; 
subplot(2,1,2);
plot(t, y);
title('Modified Signal');
xlabel('Time (s)');
ylabel('Amplitude');


sound(y, newFs);
pause;
clear sound;

end

