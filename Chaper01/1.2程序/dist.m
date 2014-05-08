function distance = dist(point, traindata)
%
%  ��һ���㵽ѵ�������е�ľ���
%
%% ������ʾ����
format long 
%% �����
m = size(traindata, 1);
distance = zeros(1,m);
for i = 1 : m
    value = (point - traindata(i,:)).^2;
    sumvalue = sum(value);
    distance(i) = sumvalue^0.5;
end