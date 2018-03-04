close all;clear;clc;
%% Load Parameters
load('Parameters.mat');
Parameters.CenterFrequency = 100e6;
%% Hardware Parameters
rx_object = sdrrx('ZedBoard and FMCOMMS2/3/4', ...
                    'IPAddress', '192.168.3.3', ...
                    'CenterFrequency', Parameters.CenterFrequency, ...
                    'GainSource', Parameters.RadioGainControlMode, ...
                    'SamplesPerFrame', Parameters.RadioFrameLength, ...
                    'BasebandSampleRate', Parameters.RadioSampleRate, ...
                    'OutputDataType', Parameters.RadioOutputDataType); 
%% FM Parameters
fmBroadcastDemod = comm.FMBroadcastDemodulator(...
                    'SampleRate', Parameters.RadioSampleRate, ...
                    'FrequencyDeviation', Parameters.FrequencyDeviation, ...
                    'FilterTimeConstant', Parameters.FilterTimeConstant, ...
                    'AudioSampleRate', Parameters.AudioSampleRate, ...
                    'PlaySound', true, ...
                    'BufferSize', Parameters.BufferSize, ...
                    'Stereo', true);
%% Button Setting
figure('Name','RX','NumberTitle','off');
button = uicontrol; % Generate GUI button
set(button,'String','Stop !','Position',[200 120 100 60]); % Add "Stop !" text
set(gcf,'Units','centimeters','position',[1 2 22 22]); % Set the postion of GUI
%% Main
try
    [~, ~] = rx_object();
    state = 1;
    while(state == 1)
        [rxSig, len] = rx_object();
        if len > 0
            % FM demodulation
            audio = fmBroadcastDemod(rxSig);
        end
        %% Plot
        % Audio time waveform
        t = [1:240]*Parameters.AudioFrameTime;
        subplot(2,2,1),plot(t,audio(:,1));hold on;subplot(2,2,1),plot(t,audio(:,2));hold off;
        axis([t(1) t(end) -2 2]);axis square;
        xlabel('Time');
        title('Audio Time Waveform');
        % Spectrum Waveform
        [Welch_Spectrum_waveform,Welch_Spectrum_frequency] = pwelch(rxSig,[],[],[],rx_object.BasebandSampleRate,'centered','power');
        subplot(2,2,2),plot(Welch_Spectrum_frequency,pow2db(Welch_Spectrum_waveform));
        axis([-rx_object.BasebandSampleRate/2 rx_object.BasebandSampleRate/2 -140 -40]);axis square;
        xlabel('Frequency');
        title('Welch Power Spectral Density');
        % Spectrogram
        subplot(2,2,4),spectrogram(rxSig,[],[],[],rx_object.BasebandSampleRate,'centered','power');
        colormap('jet');
        title('Spectrogram');axis square;
        
        drawnow;
        % ----- Button Behavior -----%
        set(button,'Callback','setstate0'); % Set the reaction of pushing button
    end

catch ME
    rethrow(ME)
end
%% Release all System objects
release(fmBroadcastDemod);
release(rx_object);
close all;