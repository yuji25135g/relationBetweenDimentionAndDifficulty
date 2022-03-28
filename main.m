%{
評価値を計算するプログラム
mainを実行する前に、以下の3つのプログラムを実行して、データを生成する必要がある。
・getReservoirWeight
・getInputWeight
・getData
%}

size_a = 7; %A行列のサイズ
N_x = 300; %リザバーのサイズ
N_u = size_a*20; %入力のサイズ
systemNum = 100; %総システム数
initialStateNum = 1000; %1システムに対する初期値の数
fval = zeros(1,size_a);
fval_array = zeros(systemNum,initialStateNum);
% リザバー重み行列読み込み
load('reservoirWeight')
%入力重み行列読み込み
load('inputWeight')
% 入力データの読み込み
load('data')
counter = 1;
for i=1:systemNum
    A = test_A(:,:,i);
    [V,~] = eig(A);
    for j=1:initialStateNum
        y = test_initialState(:,:,counter);
        counter = counter + 1;
        alpha = V\y;
        disp(num2str(i)+"-"+num2str(j))
        for k=1:size_a
            V1=V;
            alpha1=alpha;
            V1(:,k) = [];
            alpha1(k) = [];
            try
                option = optimoptions('fminunc','OptimalityTolerance',1e-4,'Display','none');
%                 関数の最小化
                [x1,fval(1,k)] = fminunc(@(alpha)objective(alpha,V1,y,A,W,Win,N_u,N_x),alpha1,option);
            catch
                [x1,fval(1,k)] = fminsearch(@(alpha)objective(alpha,V1,y,A,W,Win,N_u,N_x),alpha1);
            end
        end
        fval_array(i,j) = min(fval);
    end
    save("result/result_"+num2str(i)+"systems",'fval_array')
end
save('results.mat')