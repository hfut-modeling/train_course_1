function k_NN
%
%    k-邻近聚类算法
%    作者：永不止步
%    时间：2013-07-31
%
%% 清理内存、数据
clc;         % 清理comman window中的数据
clear;       % 清理环境变量
close all;   % 关闭所有GUI窗口
%% 参数设置
k = 20;
%% 读取数据
data = importdata('exam2_data.txt');
%% 归一化数据
[norm_data, ranges, minvalues] = normalization(data(:,1:3));
train_input = norm_data(1:900,:);
testing_input = norm_data(901:1000,:);
train_output = data(1:900,4);
testing_output = data(901:1000,4);
%% 求测试数据与训练集的距离
distances = zeros(size(testing_input,1), size(train_input, 1));
for i = 1 : size(testing_input,1)
    distances(i,:) = dist(testing_input(i,:), train_input);
end
%% 按照距离递增排序，并计算前k个类别的频次，选取最高的作为该数据的类别
classes_test = zeros(size(testing_input,1), 1);
for i = 1 : size(testing_input,1)
    % 距离排序
    [sorteddistance, index] = sort(distances(i,:));
    % 对前k个类别统计频次
    freclass = zeros(1,3);
    for j = 1 : k
        c = train_output(index(j));  % 类别
        freclass(c) = freclass(c) + 1; % 累加
    end 
    % 找出频次最高的作为类别
    [maxvalue, ind] = max(freclass);
    classes_test(i) = ind;
end
%% 计算错误率
errcount = 0;
for i = 1 : size(testing_input,1)
    if classes_test(i) ~= testing_output(i)
        errcount = errcount + 1;
    end
end
error_ratio = errcount / size(testing_input,1);
disp(['该算法分类的错误概率为：', num2str(error_ratio)]);

