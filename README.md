第一期培训资料
==============


#### 注意事项

- 在 matlab2013 版本下，需要将 rep 函数改为 repmat
- 手写识别样本数据读取方式如下：
``` matlab
a = textread('0_0.txt', '%s');                                                                                       
b_0_0 = cell2mat(a);
```
- 由于手写识别数据太多，单个读取不可取，应使用 eval 函数 或者 for 循环批量读取

``` matlab
list = dir(['F:\data\', '0_*.txt']);

k = length(list);
for i = 1:k
    str = strcat('F:\data\', list(i).name); % str = ['F:\data\', list(i).name]
    tmp = textread(str, '%s');                                                                                       
    a_0{i} = cell2mat(a);
end
```
