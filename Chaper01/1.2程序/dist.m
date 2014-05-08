function distance = dist(point, traindata)
%
%  求一个点到训练集所有点的距离
%
%% 增加显示精度
format long 
%% 求距离
m = size(traindata, 1);
distance = zeros(1,m);
for i = 1 : m
    value = (point - traindata(i,:)).^2;
    sumvalue = sum(value);
    distance(i) = sumvalue^0.5;
end