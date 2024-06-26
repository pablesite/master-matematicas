function [X,Y,iter ,incr ]= Difnolin3 (f,fy ,fz ,a,b,alfa , beta ,N,maxiter ,tol)
% f = f(x,y,z) es la ecuacion diferencial
% fy = fy(x,y,z) es la parcial de f respecto a y
% fz = fz(x,y,z) es la parcial de f respecto a ... y'= z;
h=(b-a)/(N+1); 
k=(beta-alfa)/(N+1); %<- PROBLEMA
X=a:h:b; 
Y=alfa:k:beta; %<- PROBLEMA 
x=X(1:N+2); 
y=Y(1:N+2);

incr=tol +1; % Inicializar parametros
iter =0;
while incr >tol && iter < maxiter
    
    z=(Y(3:N+2)-Y(1:N))/(2* h); %Estimacion de la
    %derivada por diferencias centrales ...
    z=[(alfa-Y(1))/2 z (Y(end)-beta)/2];%% CAMBIAR PRIMERA COMPONENTE DE Z Y ULTIMA POR LAS DEDUCIDAS A MANO -y0+alpha,z,z (y(end) -beta)/2
    
    fe= feval (f,x,y,z);
    fye= feval (fy ,x,y,z);
    fze= feval (fz ,x,y,z);
    
    %matriz jacobiana
    dp =2+h^2*fye; %siempre es asi
    dp(1)=  (2-h) + h^2*fye(1) - h^2/2*fze(1);      %la cambiamos por la que toca
    dp(end)=(2-h) + h^2*fye(end) + h^2/2*fze(end);   %la cambiamos por la que toca
   
    ds = -1+h/2*fze(1 :end -1);
    ds(1)=-2;   %suele dar -2
    
    di=-1-h/2*fze(2:end);
    di(end)=-2;

    
    %VECTOR F--------
    d(2:N+1)=-(-diff(Y,2)+h^2*fe(2:N+1));
    d(1)=(2-h)*y(1)-2*y(2)+h^2*fe(1)+ 2*h*alfa;
    d(1)=-d(1);
    
    d(N+2)= -2*y(N+1)+(2-h)*y(N+2)+h^2*fe(N+2)+beta*h;
    d(N+2)=-d(N+2);
    
    v= Crout(dp,ds,di,d);
    y=y+v';
    Y=y;
    incr=max(abs(v));
    iter= iter +1;
end
X=X(:);
Y=Y(:);
end