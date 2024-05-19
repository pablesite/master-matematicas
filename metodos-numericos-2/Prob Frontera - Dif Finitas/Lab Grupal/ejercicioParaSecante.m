function dy=ejercicioParaSecante(x,y)
    dy=zeros(2,1);
    dy(1)=y(2);
    dy(2) =-y(2).^2+4*y(1)+2;
end