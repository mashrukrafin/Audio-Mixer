function Normalizefunc(desired_peak_amplitude)

[y, Fs] = audioread(input('BEKSY.mp3 '));

current_peak_amplitude = max(abs(y));
normalization_factor = desired_peak_amplitude ./ current_peak_amplitude;

yn = y .* normalization_factor;

subplot(2, 1, 1)
plot(y, 'm');
subplot(2, 1, 2)
plot(yn);

sound(yc, Fs);
pause;
clear sound;
end