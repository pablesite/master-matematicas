function F= ej10 (x,y)
F= zeros (4,1);
F(1)=y(2);
F(2)=-(1./x).*y(2);
F(3)=y(4);
F(4)=-(1./x).*y(4);
end