function k_NN
%
%    k-�ڽ������㷨
%    ���ߣ�����ֹ��
%    ʱ�䣺2013-07-31
%
%% �����ڴ桢����
clc;         % ����comman window�е�����
clear;       % ����������
close all;   % �ر�����GUI����
%% ��������
k = 20;
%% ��ȡ����
data = importdata('exam2_data.txt');
%% ��һ������
[norm_data, ranges, minvalues] = normalization(data(:,1:3));
train_input = norm_data(1:900,:);
testing_input = norm_data(901:1000,:);
train_output = data(1:900,4);
testing_output = data(901:1000,4);
%% �����������ѵ�����ľ���
distances = zeros(size(testing_input,1), size(train_input, 1));
for i = 1 : size(testing_input,1)
    distances(i,:) = dist(testing_input(i,:), train_input);
end
%% ���վ���������򣬲�����ǰk������Ƶ�Σ�ѡȡ��ߵ���Ϊ�����ݵ����
classes_test = zeros(size(testing_input,1), 1);
for i = 1 : size(testing_input,1)
    % ��������
    [sorteddistance, index] = sort(distances(i,:));
    % ��ǰk�����ͳ��Ƶ��
    freclass = zeros(1,3);
    for j = 1 : k
        c = train_output(index(j));  % ���
        freclass(c) = freclass(c) + 1; % �ۼ�
    end 
    % �ҳ�Ƶ����ߵ���Ϊ���
    [maxvalue, ind] = max(freclass);
    classes_test(i) = ind;
end
%% ���������
errcount = 0;
for i = 1 : size(testing_input,1)
    if classes_test(i) ~= testing_output(i)
        errcount = errcount + 1;
    end
end
error_ratio = errcount / size(testing_input,1);
disp(['���㷨����Ĵ������Ϊ��', num2str(error_ratio)]);

