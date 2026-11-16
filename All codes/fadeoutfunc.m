function fadeoutfunc( h )
[y, Fs] = audioread(input('BEKSY.mp3: '));

amplitudeEnvelope = [logspace(2, -abs(h), length(y))];
s = y .* amplitudeEnvelope';

subplot(2, 1, 1)
plot(y, 'm');
subplot(2, 1, 2)
plot(s);

sound(S, Fs);
pause;
clear sound;

end

