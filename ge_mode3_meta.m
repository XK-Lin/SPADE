clear; clc
Lambda = 7*0.02e-3;
gamma = 90;
[X,Y] = meshgrid((1:792)*0.02e-3,(1:600)*0.02e-3);
B = 2*pi/Lambda*(cosd(gamma)*X+sind(gamma)*Y);

red = 1/0.9375; % adjust the size of the intensity peak, not critical

mode3 = Generate_FTzernike(-1,1,600,792,red);
P_mode3 = angle(mode3);
sorter3_ytilt_7 = exp(1i*(P_mode3+B));
save('/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/sorter3_ytilt_7.mat','sorter3_ytilt_7')
image = mod(P_mode3+B,2*pi);
alpha = 152;
SLM_image = uint8(image*alpha/(2*pi));
imwrite(SLM_image,'/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/SLM_sorter3_ytilt_7.bmp','bmp')

output_field3 = fftshift(fft2(fftshift(mode3.*sorter3_ytilt_7)));
output_intensity3 = abs(output_field3).^2;

mode1 = Generate_FTzernike(0,0,600,792,red);
mode2 = Generate_FTzernike(1,1,600,792,red);

output_field1 = fftshift(fft2(fftshift(mode1.*sorter3_ytilt_7)));
output_intensity1 = abs(output_field1).^2;
output_field2 = fftshift(fft2(fftshift(mode2.*sorter3_ytilt_7)));
output_intensity2 = abs(output_field2).^2;

lambda = 795e-9; f = 400e-3; Lx = 792*0.02e-3; Ly = 600*0.02e-3;
du = lambda*f/Lx; dv = lambda*f/Ly;
u = -396*du:du:395*du; v = -300*dv:dv:299*dv;
u_mm = u*1e3; v_mm = v*1e3;

figure(1)
set(gcf,'Position',[250,250,1500,400])

subplot(1,3,1)
imagesc(u_mm,v_mm,output_intensity1)
xlabel('[mm]'); ylabel('[mm]')
colorbar

subplot(1,3,2)
imagesc(u_mm,v_mm,output_intensity2)
xlabel('[mm]'); ylabel('[mm]')
colorbar

subplot(1,3,3)
imagesc(u_mm,v_mm,output_intensity3)
xlabel('[mm]'); ylabel('[mm]')
colorbar
