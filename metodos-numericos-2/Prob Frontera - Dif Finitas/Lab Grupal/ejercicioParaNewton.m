function F= ejercicioParaNewton (x,y)
F= zeros (4,1);
F(1)=y(2);
F(2)=-y(2).^2+4*y(1)+2;
F(3)=y(4);
F(4)=4*y(3)-2*y(2)*y(4);
end