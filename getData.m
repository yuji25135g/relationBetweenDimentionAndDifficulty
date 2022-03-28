%Dataの生成

clear()
systemNum = 100;
initialStateNum = 1000;
size_a = 7;
test_A = zeros(size_a,size_a,systemNum);
test_initialState = zeros(size_a,1,initialStateNum*systemNum);

for i=1:systemNum
    test_A(:,:,i) = getAFromEig(size_a);
end

for i=1:initialStateNum*systemNum
    test_initialState(:,:,i) = normalize(2*rand(size_a,1)-1,'norm');
end

save('data.mat','test_A','test_initialState')