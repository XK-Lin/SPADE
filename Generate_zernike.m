function Z = Generate_zernike(m,n,x_pixel,y_pixel)

Z = 0;

Zmn = zeros(x_pixel,y_pixel);

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
[t,r] = cart2pol(X,Y);

Rmn_each = zeros(x_pixel,y_pixel,(n-abs(m))/2+1);

for i = 1:((n-abs(m))/2+1)
    s = i-1;
    Rmn_each(:,:,i) = (-1)^s*factorial(n-s)/(factorial(s)*factorial((n+abs(m))/2-s)*...
        factorial((n-abs(m))/2-s))*r.^(n-2*s);
end
Rmn = sum(Rmn_each,3);
N = sqrt(2*(n+1)/(1+double(kroneckerDelta(sym(m)))));
if m < 0
    Zmn = -N*Rmn.*sin(m*t);
else
    Zmn = N*Rmn.*cos(m*t);
end

c = double(r<=1);
Zmn = Zmn.*c;

Z = Zmn/sqrt(pi);

end
