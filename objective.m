%最小化したい関数OBJECTIVE
function difference = objective(alpha,V,y,A,W,Win,Nu,Nx)
%x：最適化したいいやな初期値
%y：評価したい初期値
%A：システム
size_a = size(A);
x = zeros(size_a(1),1);
for i=1:size_a(1)-1
    x = x+alpha(i)*V(:,i);
end
x = normalize(x,'norm');
Ux = state_gen(A,x);
Uy = state_gen(A,y);
outx = RC(Win,W,Ux,Nu,Nx,20,ones(Nx,1));
outy = RC(Win,W,Uy,Nu,Nx,20,ones(Nx,1));
difference = sum(sqrt(sum((outx-outy).^2,1)))/sqrt(size_a(1));
end