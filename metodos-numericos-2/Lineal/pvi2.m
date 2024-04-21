function [dv]=pvi2(x,v)
    % Funcion que describe el segundo PVI
    dv=zeros(2,1);
    dv(1)=v(2);
    dv(2)= -(2./x).*v(2)+(2./(x.^2)).*v(1);
end