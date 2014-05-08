function [normdata, ranges, minvalues] = normalization(dataset)
%
%  ��һ������
%
%% ��ÿ�е���С�����ֵ
% minvalues = min(dataset, [], 1);
% maxvalues = max(dataset, [], 1);
minvalues = min(dataset);
maxvalues = max(dataset);

%% ÿ�е����ֵ����Сֵ��ֵ
ranges = maxvalues - minvalues;

%% ��һ������
m = size(dataset, 1);  % dataset������
normdata = (dataset - rep(minvalues, [m, 1]))./rep(ranges, [m , 1]);
