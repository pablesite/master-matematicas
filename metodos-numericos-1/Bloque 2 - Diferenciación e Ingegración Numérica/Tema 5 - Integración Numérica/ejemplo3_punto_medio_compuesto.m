clear all; close all;

% Defino el vector de las equis, con el doble de puntos. El primero
% ficticio va a la izquierda del primero real, y el último a la derecha del
% último real.
% Notar que este vector sólo lo necesito para pasar los puntos inicial y
% final.
x = -1.52/2:1.52/2:9.12+1.52/2;

% Parámetros de entrada
F = [0, 40.04, 57.83, 62.28, 46.71, 53.38, 22.24];
alpha = [0.5, 1.4, 0.75, 0.9, 1.3, 1.48, 1.5];

% Calculo W en base al enunciado
W = F.*cos(alpha);

% Calculo el número de puntos (el doble de los que tengo)
n = length(x);

IT1 = puntoMedioDatos(W, x(1), x(end), n)


