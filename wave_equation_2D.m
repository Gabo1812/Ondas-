function [Z, X, Y] = wave_equation_2D(x_i, x_f, y_i, y_f, Nx, Ny, T, dt, c)
    % Definición de los pasos espaciales
    hx = (x_f - x_i) / (Nx + 1);
    hy = (y_f - y_i) / (Ny + 1);
    
    % Crear los vectores de malla
    x = (x_i:hx:x_f)'; % Vectores de posición en x
    y = (y_i:hy:y_f)'; % Vectores de posición en y
    
    % Crear mallas 2D para las posiciones
    [X, Y] = meshgrid(x, y);
    
    % Inicializar matrices para el tiempo
    Z = zeros(Nx + 2, Ny + 2, T); % Ajustar dimensiones para incluir fronteras
    
    % Definir la longitud del dominio
    L_x = x_f - x_i; % Longitud en x
    L_y = y_f - y_i; % Longitud en y

    % Definir condiciones iniciales basadas en variables separables
    for i = 2:Nx+1
        for j = 2:Ny+1
            n = 1; % Número de modo (puedes variar)
            m = 1; % Número de modo en y (puedes variar)
            Z(i,j,1) = sin(n * pi * (x(i-1) - x_i) / L_x) * sin(m * pi * (y(j-1) - y_i) / L_y); % Ejemplo de condición inicial
            Z(i,j,2) = Z(i,j,1); % Suponiendo que la primera derivada temporal es cero      
        end
    end

    % Bucle en el tiempo
    for t = 3:T
        for i = 2:Nx+1
            for j = 2:Ny+1
                % Discretizando la ecuación
                Z(i,j,t) = 2 * Z(i,j,t-1) - Z(i,j,t-2) + (c^2 * dt^2 / hx^2) * ...
                           (Z(i+1,j,t-1) - 2 * Z(i,j,t-1) + Z(i-1,j,t-1)) + ...
                           (c^2 * dt^2 / hy^2) * ...
                           (Z(i,j+1,t-1) - 2 * Z(i,j,t-1) + Z(i,j-1,t-1));      
            end
        end

        % Aplicar condiciones de frontera
        Z(:, 1, t) = 0;   % Condición inferior
        Z(:, Ny+2, t) = 0;  % Condición superior
        Z(1, :, t) = 0;   % Condición izquierda
        Z(Nx+2, :, t) = 0;  % Condición derecha
    end
    
end



