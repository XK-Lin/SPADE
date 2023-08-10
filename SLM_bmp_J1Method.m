function [SLM_image, SLM_phase] = SLM_bmp_J1Method(ComplexField)

%alpha=536;  %pixel depth 255; and wavelength 532 nm  (for cambridge correlator SLM)
%alpha=639;  %pixel depth 255; and wavelength 635 nm  (for cambridge correlator SLM)
alpha=152;% Since I cant go beyond 255

%Creates an SLM bitmap for a desired mode
% For a desired mode U=Aexp(iphi) encode an SLM phase,
% Psi = J1^-1(0.58*A)*sin(phi'), where phi'=phi+carrier and J1^-1 is the
% inverse Bessel function.
% 
% Based on Method 3 in V. Arrizón et al "Pixelated phase computer holograms
% for the accurate encoding of scalar complex fields," JOSA A 24, 3500
% (2007)
% 
% Written by Brandon Rodenburg
% May 2013
% Modified by Sethuraj || July 2022

% normalize amplitude to 1
ComplexField = ComplexField./max(ComplexField(:));

% Create lookup table (lut) for J0^-1(x) (x in [0,0.58] -> [0,1.8])
n = 1000;
lut = linspace(0,1.8411879,n); % in range [0,1.841]
Index = besselj(1,lut); % in range [0,0.581865]

% Extract Amplitude and Phase of desired field
% Note: amplitude must be scaled because inverse J1 is only for < 0.581865
Amplitude = 0.581865*abs(ComplexField);
phase = mod(angle(ComplexField),2*pi);

J1Inverse = interp1(Index, lut, Amplitude);

% Phase to put on SLM
%SLM_phase = mod(J1Inverse.*sin(phase)+2*pi,2*pi);
SLM_phase = J1Inverse.*sin(phase)+pi;
% 8-bit image to put on SLM
SLM_image = uint8(SLM_phase*alpha/(2*pi));



end