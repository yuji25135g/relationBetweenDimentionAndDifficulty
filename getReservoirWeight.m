%リザバー重み行列wの作成と保存
clear()
N_x = 300; %リザバーのサイズ
rho = 0.995; %スペクトル半径
density = 0.1;
%wの初期化
W = zeros(N_x); 
W = gen_randomW(N_x, density, W);
%結合重み行列wの固有値
eigv_list = eig(W); 
%現在のスペクトル半径（固有値の絶対値の最大値）
sp_radius = max(abs(eigv_list));
%任意のスペクトル半径rhoに合うようにwをスケーリング
W = W * rho / sp_radius;  

save('reservoirWeight','W')