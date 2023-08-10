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
mode1 = Generate_zernike(0, 0, N_row, N_col);
mode2 = Generate_zernike(1, 1, N_row, N_col);
mode3 = Generate_zernike(-1, 1, N_row, N_col);
mode4 = Generate_zernike(-2, 2, N_row, N_col);
mode5 = Generate_zernike(0, 2, N_row, N_col);
mode6 = Generate_zernike(2, 2, N_row, N_col);

save('/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/mode1.mat', 'mode1')
save('/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/mode2.mat', 'mode2')
save('/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/mode3.mat', 'mode3')
save('/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/mode4.mat', 'mode4')
save('/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/mode5.mat', 'mode5')
save('/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/mode6.mat', 'mode6')

SLM_mode1 = SLM_bmp_J1Method(mode1 .* exp(1i * (X_2d .* k_x + Y_2d .* k_y)));
SLM_mode2 = SLM_bmp_J1Method(mode2 .* exp(1i * (X_2d .* k_x + Y_2d .* k_y)));
SLM_mode3 = SLM_bmp_J1Method(mode3 .* exp(1i * (X_2d .* k_x + Y_2d .* k_y)));
SLM_mode4 = SLM_bmp_J1Method(mode4 .* exp(1i * (X_2d .* k_x + Y_2d .* k_y)));
SLM_mode5 = SLM_bmp_J1Method(mode5 .* exp(1i * (X_2d .* k_x + Y_2d .* k_y)));
SLM_mode6 = SLM_bmp_J1Method(mode6 .* exp(1i * (X_2d .* k_x + Y_2d .* k_y)));

imwrite(SLM_mode1, '/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/SLM_mode1.bmp', 'bmp')
imwrite(SLM_mode2, '/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/SLM_mode2.bmp', 'bmp')
imwrite(SLM_mode3, '/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/SLM_mode3.bmp', 'bmp')
imwrite(SLM_mode4, '/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/SLM_mode4.bmp', 'bmp')
imwrite(SLM_mode5, '/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/SLM_mode5.bmp', 'bmp')
imwrite(SLM_mode6, '/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/SLM_mode6.bmp', 'bmp')

%%
ftmode1 = Generate_FTzernike(0, 0, N_row, N_col, 1.2);
ftmode2 = Generate_FTzernike(1, 1, N_row, N_col, 1.2);
ftmode3 = Generate_FTzernike(-1, 1, N_row, N_col, 1.2);
ftmode4 = Generate_FTzernike(-2, 2, N_row, N_col, 1.2);
ftmode5 = Generate_FTzernike(0, 2, N_row, N_col, 1.2);
ftmode6 = Generate_FTzernike(2, 2, N_row, N_col, 1.2);

save('/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/ftmode1.mat', 'ftmode1')
save('/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/ftmode2.mat', 'ftmode2')
save('/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/ftmode3.mat', 'ftmode3')
save('/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/ftmode4.mat', 'ftmode4')
save('/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/ftmode5.mat', 'ftmode5')
save('/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/ftmode6.mat', 'ftmode6')

SLM_ftmode1 = SLM_bmp_J1Method(ftmode1 .* exp(1i * (X_2d .* k_x + Y_2d .* k_y)));
SLM_ftmode2 = SLM_bmp_J1Method(ftmode2 .* exp(1i * (X_2d .* k_x + Y_2d .* k_y)));
SLM_ftmode3 = SLM_bmp_J1Method(ftmode3 .* exp(1i * (X_2d .* k_x + Y_2d .* k_y)));
SLM_ftmode4 = SLM_bmp_J1Method(ftmode4 .* exp(1i * (X_2d .* k_x + Y_2d .* k_y)));
SLM_ftmode5 = SLM_bmp_J1Method(ftmode5 .* exp(1i * (X_2d .* k_x + Y_2d .* k_y)));
SLM_ftmode6 = SLM_bmp_J1Method(ftmode6 .* exp(1i * (X_2d .* k_x + Y_2d .* k_y)));

imwrite(SLM_ftmode1, '/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/SLM_ftmode1.bmp', 'bmp')
imwrite(SLM_ftmode2, '/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/SLM_ftmode2.bmp', 'bmp')
imwrite(SLM_ftmode3, '/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/SLM_ftmode3.bmp', 'bmp')
imwrite(SLM_ftmode4, '/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/SLM_ftmode4.bmp', 'bmp')
imwrite(SLM_ftmode5, '/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/SLM_ftmode5.bmp', 'bmp')
imwrite(SLM_ftmode6, '/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/SLM_ftmode6.bmp', 'bmp')
