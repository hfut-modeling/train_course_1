function [normdata, ranges, minvalues] = normalization(dataset)
%
%  归一化函数
%
%% 求每列的最小、最大值
% minvalues = min(dataset, [], 1);
% maxvalues = max(dataset, [], 1);
minvalues = min(dataset);
maxvalues = max(dataset);

%% 每列的最大值与最小值差值
ranges = maxvalues - minvalues;

%% 归一化数据
m = size(dataset, 1);  % dataset的行数
normdata = (dataset - rep(minvalues, [m, 1]))./rep(ranges, [m , 1]);
