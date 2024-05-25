%Ejecutable Act Grupal Newton
clear all; close all

%%
digits(8)
[xi ,yi ,t,iter, incre ] = DisparoNewtonP1 ('ejercicioParaNewton',1,2,0,-3,100,1e-10,50)
%%

[xi(1:2:end),yi(1:2:end,1)]

%%
hold on
plot(yi(:,1),xi,'or')
