1;
d = 1e-6;
range = linspace(-10,10,100);
[xx,yy] = meshgrid(range);

for i=1:rows(xx)
	for j=1:columns(yy)
		M1(i,j) = (xx(i,j)-d)/(norm([xx(i,j)-d, yy(i,j)],2)^3);
		N1(i,j) = yy(i,j)/(norm([xx(i,j)-d, yy(i,j)],2)^3);
		M2(i,j) = -(xx(i,j)+d)/(norm([xx(i,j) + d, yy(i,j)],2)^3);
		N2(i,j) = -yy(i,j)/(norm([xx(i,j)+d, - yy(i,j)],2)^3);
	endfor
endfor
quiver(xx,yy,1000*M1,1000*N1);