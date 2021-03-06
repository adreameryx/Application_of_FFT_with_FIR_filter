function Hd = BPF
%BPF Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.5 and DSP System Toolbox 9.7.
% Generated on: 15-May-2020 23:50:03

% Equiripple Bandpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 1000;  % Sampling Frequency

N      = 60;   % Order
Fstop1 = 25;   % First Stopband Frequency
Fpass1 = 50;   % First Passband Frequency
Fpass2 = 260;  % Second Passband Frequency
Fstop2 = 285;  % Second Stopband Frequency
Wstop1 = 1;    % First Stopband Weight
Wpass  = 1;    % Passband Weight
Wstop2 = 1;    % Second Stopband Weight
dens   = 20;   % Density Factor

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, [0 Fstop1 Fpass1 Fpass2 Fstop2 Fs/2]/(Fs/2), [0 0 1 1 0 ...
    0], [Wstop1 Wpass Wstop2], {dens});
Hd = dsp.FIRFilter( ...
    'Numerator', b);

% [EOF]
