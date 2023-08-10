function FTz = Generate_FTzernike(m,n,x_pixel,y_pixel,red)

FTz = zeros(x_pixel,y_pixel);

if n-abs(m)<0
    disp('   Error: n-|m| should be non-negative.')
    return
end

if mod(n-abs(m),2)==1
    disp('   Error: n-|m| should be even.')
    return
end

side = min(x_pixel,y_pixel);
d = 2/side;
if side == x_pixel
    x = (-1+d/2):d:(1-d/2);
    y = -y_pixel/x_pixel+d/2:d:y_pixel/x_pixel-d/2;
else
    x = -x_pixel/y_pixel+d/2:d:x_pixel/y_pixel-d/2;
    y = (-1+d/2):d:(1-d/2);
end
[X,Y] = meshgrid(y,x);
[t,rr] = cart2pol(X,Y);
r = rr*red;

if m>=0
    FTz = 2*pi*(1i)^n*besselj(n+1,2*pi*r)./(2*pi*r).*cos(m*t);
else
    FTz = 2*pi*(1i)^n*besselj(n+1,2*pi*r)./(2*pi*r).*sin(m*t);
end

FTz = FTz/sqrt(max(max(FTz.*conj(FTz))));

end
