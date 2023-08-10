clear; clc
Lambda = 7*0.02e-3;
gamma2 = 0;
gamma3 = 90;
[X,Y] = meshgrid((1:792)*0.02e-3,(1:600)*0.02e-3);
B2 = 2*pi/Lambda*(cosd(gamma2)*X+sind(gamma2)*Y);
B3 = 2*pi/Lambda*(cosd(gamma3)*X+sind(gamma3)*Y);

red = 1/0.9375; % adjust the size of the intensity peak, not critical

mode2 = Generate_FTzernike(1,1,600,792,red);
mode3 = Generate_FTzernike(-1,1,600,792,red);

P_mode2 = angle(mode2);
P_mode3 = angle(mode3);

sorter23_xytilt_7 = exp(1i*angle(exp(1i*(-P_mode2+B2))+exp(1i*(-P_mode3+B3))));
save('/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/sorter23_xytilt_7.mat','sorter23_xytilt_7')
image = angle(exp(1i*(-P_mode2+B2))+exp(1i*(-P_mode3+B3)))+pi;
alpha = 152;
SLM_image = uint8(image*alpha/(2*pi));
imwrite(SLM_image,'/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/SLM_sorter23_xytilt_7.bmp','bmp')

output_field2 = fftshift(fft2(fftshift(mode2.*sorter23_xytilt_7)));
output_intensity2 = abs(output_field2).^2;
output_field3 = fftshift(fft2(fftshift(mode3.*sorter23_xytilt_7)));
output_intensity3 = abs(output_field3).^2;

mode1 = Generate_FTzernike(0,0,600,792,red);

output_field1 = fftshift(fft2(fftshift(mode1.*sorter23_xytilt_7)));
output_intensity1 = abs(output_field1).^2;

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