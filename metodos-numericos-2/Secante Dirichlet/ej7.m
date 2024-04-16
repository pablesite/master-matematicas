function dy = ej7(x,y)
    dy = zeros(2,1);
    dy(1) = y(2);
    dy(2) = (1/8)*(32+2*x.^3-y(1).*y(2));
end