function echofunc( decay_factor,delay_time )

[y, Fs] = audioread('BEKSY.mp3');

%parameter   
delay_samples = round(delay_time * Fs);

%echo
num_channels = size(y, 2);
y_echo = zeros(size(y));

for i = 1:num_channels
    y_delayed = [zeros(delay_samples, 1); 
    y(1:end-delay_samples, i)] * decay_factor;
    y_echo(:, i) = y(:, i) + y_delayed;
end

%plotting
    t = (0:size(y, 1)-1) / Fs; 
    subplot(2, 1, 1);
    plot(t, y);
    title('Original Signal');
    xlabel('Time (s)');
    ylabel('Amplitude');

    subplot(2, 1, 2);
    plot(t, y_echo);
    title('Echoed Signal');
    xlabel('Time (s)');
    ylabel('Amplitude');

sound(y_echo, Fs);
pause;
clear sound;

end

