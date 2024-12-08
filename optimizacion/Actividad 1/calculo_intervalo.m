function intervalo_seleccionado = calculo_intervalo(df)
syms x
% Encuentra las raíces de la derivada
raices = solve(df == 0, x);

% Inicializar vector para almacenar raíces válidas
raices_reales = [];

% Recorrer las raíces
for i = 1:length(raices)
    raiz = raices(i);
    
    % Comprobar si es real y diferente de cero
    if isAlways(imag(raiz) == 0) && isAlways(raiz ~= 0)
        raices_reales = [raices_reales, raiz];
    end
end


% Filtrar las raíces positivas
raices_positivas = double(raices_reales(raices_reales > 0));

% Seleccionar la raíz positiva más cercana a cero
if ~isempty(raices_positivas)
    raiz_seleccionada = min(raices_positivas); % Raíz positiva más pequeña
    intervalo_seleccionado = [raiz_seleccionada - 0.5, raiz_seleccionada + 0.5];
else
    disp('No hay raíces positivas para seleccionar un intervalo.');
    intervalo_seleccionado = [-0.5, 0.5];
end