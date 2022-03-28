%入力結合重み行列Winの作成と保存
size_a = 7;
N_u = size_a*20; %入力のサイズ
N_x = 300; %リザバーのサイズ
inputScale = 0.7; %入力結合重み行列の要素のスケーリング値
Win = 2*inputScale*rand(N_x, N_u) - inputScale;

save('inputWeight','Win')
