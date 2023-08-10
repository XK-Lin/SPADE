clear; clc
Lambda = 7*0.02e-3;
gamma = 90;
red = 1/0.9375;
[X,Y] = meshgrid((1:792)*0.02e-3,(1:600)*0.02e-3);
B = 2*pi/Lambda*(cosd(gamma)*X+sind(gamma)*Y);

image = mod(B,2*pi);
alpha = 152;
SLM_image = uint8(image*alpha/(2*pi));
imwrite(SLM_image,'/Users/lin/Desktop/Meta/Spring 2023/MATLAB/SLM_simulation/SLM mat and bmp files/SLM_grating_ytilt_7.bmp','bmp')

mode1 = Generate_FTzernike(0,0,600,792,red);

output_field1 = fftshift(fft2(ifftshift(mode1.*exp(1i*B))));
output_intensity1 = abs(output_field1).^2;

lambda = 795e-9; f = 400e-3; Lx = 792*0.02e-3; Ly = 600*0.02e-3;
du = lambda*f/Lx; dv = lambda*f/Ly;
u = -396*du:du:395*du; v = -300*dv:dv:299*dv;
u_mm = u*1e3; v_mm = v*1e3;

figure(1)
subplot(2,2,1)
imagesc(abs(mode1).^2)
axis square
colormap gray
colorbar

subplot(2,2,2)
imagesc(abs(mode1.*exp(1i*B)).^2)
axis square
colormap gray
colorbar

subplot(2,2,3)
imagesc(u_mm,v_mm,abs(fftshift(fft2(fftshift(mode1)))).^2./max(max(abs(fftshift(fft2(fftshift(mode1)))).^2)))
xlabel('[mm]'); ylabel('[mm]')
axis square
colormap gray
colorbar

subplot(2,2,4)
imagesc(u_mm,v_mm,output_intensity1./max(max(output_intensity1)))
xlabel('[mm]'); ylabel('[mm]')
axis square
colormap gray
colorbar

sgtitle('$\Lambda=7\,\mathrm{pixel}$','Interpreter','latex')

figure(2)
imagesc(image)
axis square
colormap gray
colorbar