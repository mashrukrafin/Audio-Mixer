function invertfunc()
    
    % Read the audio file
    [y, Fs] = audioread('BEKSY.mp3');

    % Invert
    y_inverted = -1 * y;
    y_inverted = y_inverted / max(abs(y_inverted(:)));

    % Plotting
    t = (0:length(y)-1) / Fs; 
    subplot(2,1,1);
    plot(t, y);
    title('Original Signal');
    xlabel('Time (s)');
    ylabel('Amplitude');

    subplot(2,1,2);
    plot(t, y_inverted);
    title('Inverted Signal');
    xlabel('Time (s)');
    ylabel('Amplitude');

    sound(y_inverted, Fs);
    pause;
    clear sound;
end

