function [x,y] = DiFiLinealEj2 (a,b,alfa ,beta ,N)
% Diferencias finitas ,
% Problema lineal de segundo orden con ...
%condiciones Dirichlet
% N es el numero de incognitas
h=(b-a)/(N+1);
x=a:h:b;

ds = x(1:end-1)+h/2; 
ds(1) = 2*x(1); % superdiagonal ... %Cambiar

di = x(2:end)-h/2; 
di(end) = 2*x(end) ; % subdiagonal de A %Cambiar

dp = -2*x(1:end) ; % diagonal principal de A
dp(1) = 2*h*x(1) -h^2 -2*x(1); %Cambiar
dp(end) = -h^2 -2*h*x(end) -2*x(end) ; %Cambiar

d = zeros(N+2,1); % terminos independientes %Cambiar
d(1) = 2*h*alfa*(x(1) -h/2); %Cambiar
d(end) = -2*h*beta *(x(end) +h/2); %Cambiar

y= Crout (dp ,ds ,di ,d); %<-- x=A\d 
x=x(:)
end