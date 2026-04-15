%% Pre-Processing
clear; clc; close all;
rng('default')
s = rng;

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

%% FFE Equalizer
currentSamples = zeros(4, 1);
for i = 1 : length(OFDMSymbols)
    currentSamples = [OFDMSymbols(i); currentSamples(1:3)];
    ffe = currentSamples(1) * h(1) + currentSamples(2) * h(2) + currentSamples(3) * h(3) + currentSamples(4) * h(4);
end