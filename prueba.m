clearvars;
% Solución para placa cuadrada de Chladni
% La ecuación a resolver es:
% (1/T)*ddT/dtt = (c^2/X)*ddX/dxx + (c^2/Y)*ddY/dyy 
% Con T(t), X(x) y Y(y)
%}
%Donde:
% c: velocidad de la onda c = sqrt(Ts/sigma)
% Y Ts: Tensión superficial y sigma la densidad del material

% Parámetros
x_i = 0; x_f = 10;
y_i = 0; y_f = 10;
Nx = 50; Ny = 50; % Resolución
% Definición de los pasos espaciales
hx = (x_f - x_i) / (Nx + 1);
hy = (y_f - y_i) / (Ny + 1);
% Crear los vectores de malla
x = (x_i:hx:x_f)'; % Vectores de posición en x
y = (y_i:hy:y_f)'; % Vectores de posición en y

T = 100; % Pasos de tiempo
dt = 0.09; % Tamaño del paso de tiempo
c = 1; % Velocidad de la onda

% Resolver la ecuación de onda
Z = wave_equation_2D(x_i, x_f, y_i, y_f, Nx, Ny, T, dt, c);


figure(1)
plot_wave(Z, T); % Dibuja la onda




%{
%Graficar solución analitica
m = 3;
n = 5;
L = 10;
plot_chladni_nodal_lines(L, n, m)
%}