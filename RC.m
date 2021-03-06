function  X = RC(inputWeight, reservoirWeight, U, N_u, N_x, T, x_0)
    %時刻の関係がわかりやすいように、XYUはT+1行に統一
    X = [x_0, zeros(N_x, T)];
    U = [zeros(N_u, 1) U];
    for n = 1: T
        reservoirInput = Input(inputWeight, U(:, n+1));


        X(:, n+1) = Reserver(reservoirWeight, reservoirInput, X(:, n));

    end
    X(:, 1) = [];
end