%difraction on gap
function difr;
L=1000000;
d=input('d=');
ny=100;
ymax=2*L/d+d/2;
dy=ymax/(ny-1);
Y=0:dy:ymax;
for n=1:ny
    In(n)=abs(quad(@f,-d/2,d/2,[],[],L,Y(n))).^2;
end
In=In/max(In);
subplot(2,1,1)
plot(Y,In,'k',-Y,In,'k',[-d/2 -d/2],[0 1],'k',[d/2 d/2],[0 1],'k')
xlabel('y');
ylabel('Intenciti');
xt1=-0.9*ymax;
yt=0.9;
s10=num2str(L);
s1=strcat('L=',s10);
text(xt1,yt,s1);
xt2=0.7*ymax;
s20=num2str(d);
s2=strcat('d=',s20);
text(xt2,yt,s2);
subplot(2,1,2)
In=sqrt(In);
Y1=Y(ny:-1:2);
Y1=[-Y1 Y];
In1=In(ny:-1:2);
In1=[In1 In];
pcolor(Y1,[1 2],[In1;In1]);
colormap(gray)
shading interp
axis off
%==============================
function y=f(x,L,y);
y=exp(i*2*pi*sqrt(L^2+(y-x).^2));