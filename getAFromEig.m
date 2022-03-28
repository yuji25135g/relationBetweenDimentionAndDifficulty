function A = getAFromEig(size_a)
    array_eig = 4*rand(1,size_a)-4; %固有値（安定になるように）
    J  = diag(array_eig);
    V = 2*rand(size_a)-1; %固有ベクトル
    A = V*J/V;
    [V1, J1] = eig(A);
end