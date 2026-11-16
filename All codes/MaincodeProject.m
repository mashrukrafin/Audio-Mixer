clc; clear all;

disp('1.Gain');
disp('2.FadeIn');
disp('3.FadeOut');
disp('4.Compression');
disp('5.Normalize');
disp('6.Reverb');
disp('7.PlaybackSpeed');
disp('8.Delay');
disp('9.Echo');
disp('10.Distortion');
disp('11,Invert');
disp('12.Chorus');
disp('13.Equalizer');

inputfile = input('Enter the name of the effect (e.g., Delay): ', 's');

if strcmp(inputfile, 'Gain')
    gain=input('Enter the gain value: ');
    gainfunc(gain);
    
elseif strcmp(inputfile, 'FadeIn')
    l = input('Enter the lower limit: '); 
    fadeinfunc(l);
    
elseif strcmp(inputfile, 'FadeOut')
    h = input('Enter the upper limit: '); 
    fadeinfunc(h);
    
elseif strcmp(inputfile, 'Compression')
t   = input('Enter the input threshold: ');  
cr = input('Enter the input compression_ratio: '); 
at = input('Enter the input attack_time: ');  
rt = input('Enter the input release_time: ');
compressionfunc( t,cr,at,rt );

elseif strcmp(inputfile, 'Normalize')
desired_peak_amplitude   = input('Enter the desired_peak_amplitude: ');  
Normalizefunc(desired_peak_amplitude)

elseif strcmp(inputfile, 'Reverb')
    time = input('Enter the time(0 to 1): ');
    decay = input('Enter the decay(0 to 1): ');
    wet = input('Enter the wet(0 to 1): ');
    reverbfunc(time,decay,wet);
    
elseif strcmp(inputfile, 'PlaybackSpeed')
    speedfactor = input('Enter the speedfactor(up to 2.5): ');
    playbackspeedfunc(speedfactor);
    
elseif strcmp(inputfile, 'Delay')
    delaytime = input('Enter the delay time(0 to 1): ');
    delayfunc(delaytime);  

elseif strcmp(inputfile, 'Echo')
    delay_time = input('Enter the delay time(0 to 1): ');
    decay_factor=input('Enter the decay factor(0 to 1): ');
    echofunc(decay_factor,delay_time);
    
elseif strcmp(inputfile, 'Distortion')
    gain = input('Enter the gain: ');
    distortionfunc(gain);

elseif strcmp(inputfile, 'Chorus')
    delay = input('Enter the delay(0 to 1): ');
    depth= input('Enter the depth(0 to 1): ');
    rate = input('Enter the rate(0 to 1): ');
    chorusfunc(delay,depth,rate);
    
elseif strcmp(inputfile, 'Invert')
    invertfunc();   
    
elseif strcmp(inputfile, 'Equalizer')
    cutoff_freq = input('Enter the cutoff_freq(e.g 2000): ');
    gain = input('Enter the gain(e.g 20): ');
    equalizerfunc(cutoff_freq,gain);
else 
     disp('Wrong Input');
end 


    
    
