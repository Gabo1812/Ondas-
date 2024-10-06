function plot_wave(W, T)
    for t = 1:T
        surf(W(:, :, t));
        axis tight;
        zlim([-1, 1]); 
        xlabel('X');
        ylabel('Y');
        zlabel('Amplitud');
        title(['Propagación de la onda en placa cuadrada = ', num2str(t)]);
        pause(0.01); % Controla la velocidad de la animación
    end
end