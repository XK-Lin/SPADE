clear; close all; clc

N_col = 792;
N_row = 600;

%% Parameters for generating SLM
delta_y = 0.02; delta_x = 0.02; % pixel size in mm
x_num = 4; y_num = 1; % num of pixels for kx and ky

a_x = +0.05; % +0.02
a_y = -0.00;
k_x = 2 * pi / (x_num * delta_x); % blaze angle in x direction in radian
k_y = 2 * pi / (y_num * delta_y); % blaze angle in x direction in radian

X_1d = linspace(-1/2, 1/2, N_col) * (N_col * delta_x);
Y_1d = linspace(-1/2, 1/2, N_row) * (N_row * delta_y);
[X_2d, Y_2d] = meshgrid(X_1d, Y_1d); % Cartesian coordinates of the pixels


%%
ftmode2 = Generate_FTzernike(1, 1, N_row, N_col, 1.2);

c = 0.1;
side = min(N_col, N_row);
d = 2/side;
x = -N_col/N_row+d/2:d:N_col/N_row-d/2;
y = (-1+d/2):d:(1-d/2);
[X,Y] = meshgrid(x,y);
[t,rr] = cart2pol(X,Y);
r = rr*1.2;
defocus = exp(1i*c*r.^2);

ftmode2_defocus_01 = ftmode2.*defocus;

save('/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/ftmode2_defocus_01.mat', 'ftmode2_defocus_01')

SLM_ftmode2_defocus_01 = SLM_bmp_J1Method(ftmode2_defocus_01 .* exp(1i * (X_2d .* k_x + Y_2d .* k_y)));

imwrite(SLM_ftmode2_defocus_01, '/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/SLM_ftmode2_defocus_01.bmp', 'bmp')
