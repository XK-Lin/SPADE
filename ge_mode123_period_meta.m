clear; clc
Lambda1 = 9*0.02e-3; Lambda2 = 7*0.02e-3; Lambda3 = 7*0.02e-3;
gamma1 = 0; gamma2 = 0; gamma3 = 90;
[X,Y] = meshgrid((1:792)*0.02e-3,(1:600)*0.02e-3);
B1 = 2*pi/Lambda1*(cosd(gamma1)*X+sind(gamma1)*Y);
B2 = 2*pi/Lambda2*(cosd(gamma2)*X+sind(gamma2)*Y);
B3 = 2*pi/Lambda3*(cosd(gamma3)*X+sind(gamma3)*Y);

red = 1/0.9375; % adjust the size of the intensity peak, not critical

mode1 = Generate_FTzernike(0,0,600,792,red);
mode2 = Generate_FTzernike(1,1,600,792,red);
mode3 = Generate_FTzernike(-1,1,600,792,red);

P_mode1 = angle(mode1);
P_mode2 = angle(mode2);
P_mode3 = angle(mode3);

sorter123_xxy_977 = exp(1i*angle(exp(1i*(-P_mode1+B1))+exp(1i*(-P_mode2+B2))+exp(1i*(-P_mode3+B3))));
save('/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/sorter123_xxy_977.mat','sorter123_xxy_977')
image = angle(exp(1i*(-P_mode1+B1))+exp(1i*(-P_mode2+B2))+exp(1i*(-P_mode3+B3)))+pi;
alpha = 152;
SLM_image = uint8(image*alpha/(2*pi));
imwrite(SLM_image,'/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/SLM_sorter123_xxy_977.bmp','bmp')

output_field1 = fftshift(fft2(fftshift(mode1.*sorter123_xxy_977)));
output_intensity1 = abs(output_field1).^2;
output_field2 = fftshift(fft2(fftshift(mode2.*sorter123_xxy_977)));
output_intensity2 = abs(output_field2).^2;
output_field3 = fftshift(fft2(fftshift(mode3.*sorter123_xxy_977)));
output_intensity3 = abs(output_field3).^2;

lambda = 795e-9; f = 400e-3; Lx = 792*0.02e-3; Ly = 600*0.02e-3;
du = lambda*f/Lx; dv = lambda*f/Ly;
u = -396*du:du:395*du; v = -300*dv:dv:299*dv;
u_mm = u*1e3; v_mm = v*1e3;

figure(1)
set(gcf,'Position',[50,250,1400,300])

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

figure(2)
imagesc(image)
pbaspect([792 600 1])
colormap gray
colorbar