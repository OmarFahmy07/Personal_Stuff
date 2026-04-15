%% Pre-Processing
clear; clc; close all;
rng('default')
s = rng;

%% Parameters
Integer_Part = 15;
Fractional_Part = 15;
Data_Width = Integer_Part + Fractional_Part;

%% Coefficients
h = [0.5; -0.25; 0.15625; -0.0625];

%% OFDM Symbol Generation
NFFT = 1024;
NumSCinRB = 12;
NusedFFT = 66 * NumSCinRB;
NGuardSC = NFFT - NusedFFT;
NSymbols = 100; % number of OFDM symbols (can change to whatever you want)
ModOrder = 256; 
ofdmmod = comm.OFDMModulator('FFTLength',NFFT,'NumSymbols',NSymbols,'NumGuardBandCarriers',[NGuardSC/2 ; NGuardSC/2]);
msg = randi([0 ModOrder-1], NusedFFT, NSymbols);
modSig = qammod(msg, ModOrder);
OFDMSymbols = ofdmmod(modSig);
OFDMSymbols = real(OFDMSymbols);

%% Fixed Point Object
F = fimath('SumMode', 'SpecifyPrecision', 'SumWordLength', Data_Width,'SumFractionLength', Fractional_Part, 'ProductMode', 'SpecifyPrecision', 'ProductWordLength', Data_Width, 'ProductFractionLength', Fractional_Part);

%% Fixed Point Conversion
OFDMSymbols_fixed = fi(OFDMSymbols, 1, Integer_Part+Fractional_Part, Fractional_Part, F);
h_fixed = fi(h, 1, Integer_Part+Fractional_Part, Fractional_Part, F);

%% FFE Equalizer
currentSamples = zeros(4, 1);
currentSamples_fixed = fi(currentSamples, 1, Integer_Part+Fractional_Part, Fractional_Part, F);
for i = 1 : length(OFDMSymbols)
    currentSamples_fixed = [OFDMSymbols_fixed(i); currentSamples_fixed(1:3)];
    x1 = currentSamples_fixed(1) * h_fixed(1);
    x2 = currentSamples_fixed(2) * h_fixed(2);
    x3 = currentSamples_fixed(3) * h_fixed(3);
    x4 = currentSamples_fixed(4) * h_fixed(4);
    x5 = x1 + x2;
    x6 = x3 + x4;
    ffe = x5 + x6;
end