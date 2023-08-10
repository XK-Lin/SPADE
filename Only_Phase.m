clear; close all; clc
format compact

addpath('/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation')

M1 = Generate_FTzernike(0,0,1024,1024,4);
M2 = Generate_FTzernike(1,1,1024,1024,4);
M3 = Generate_FTzernike(-1,1,1024,1024,4);

P1 = angle(M1);
P2 = angle(M2);
P3 = angle(M3);

% Inner products with themselves
fprintf('Inner product of each mode with itself:\n\n')
I1 = trapz(trapz(M1.*conj(M1)))
I2 = trapz(trapz(M2.*conj(M2)))
I3 = trapz(trapz(M3.*conj(M3)))

% Inner product of a mode and another mode's phase (with complex
% conjugation)
fprintf(['\nFirst number refers to complete mode, second number refers to the' ...
    ' phase-only mode, with complex conjugation:\n\n'])
Int12 = trapz(trapz(M1.*(exp(-1i*P2))))
Int13 = trapz(trapz(M1.*(exp(-1i*P3))))
Int23 = trapz(trapz(M2.*(exp(-1i*P3))))
Int21 = trapz(trapz(M2.*(exp(-1i*P1))))
Int31 = trapz(trapz(M3.*(exp(-1i*P1))))
Int32 = trapz(trapz(M3.*(exp(-1i*P2))))

% Inner product of a mode and another mode's phase (without complex
% conjugation)
fprintf(['\nFirst number refers to complete mode, second number refers to the' ...
    ' phase-only mode, without complex conjugation:\n\n'])
Int12 = trapz(trapz(M1.*(exp(1i*P2))))
Int13 = trapz(trapz(M1.*(exp(1i*P3))))
Int23 = trapz(trapz(M2.*(exp(1i*P3))))
Int21 = trapz(trapz(M2.*(exp(1i*P1))))
Int31 = trapz(trapz(M3.*(exp(1i*P1))))
Int32 = trapz(trapz(M3.*(exp(1i*P2))))
