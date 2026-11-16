function gainfunc( gain )
[y, Fs] = audioread(input('BEKSY.mp3: '));
yg = y * gain;

subplot(2, 1, 1)
plot(y, 'm');
subplot(2, 1, 2)
plot(yg);

sound(yg, Fs);
pause;
clear sound;
end

