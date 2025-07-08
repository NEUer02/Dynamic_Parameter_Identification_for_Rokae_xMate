# 关于这个数据集的说明

## 信息

制作人：庞嗷呜

联系邮箱：aowu.pang@gmail.com

时间：2023年11月9日

可参考的官网文档：[使用深度学习进行时间序列预测](https://www.mathworks.com/help/deeplearning/ug/time-series-forecasting-using-deep-learning_zh_CN.html)

## 数据结构

行：对应关节轴的数量，从行1-7对应关节轴1-7；

列：数据帧个数，数量由代码中指定的帧长度和滑动百分比决定；

元素：包含了若干通道的数据的元组；

元组：通道数 $\times$帧长度 的数组；

LSTM_net_backup.mat 参数部分是两步法辨识结果，LSTM网络按照semi-parameters训练；
LSTM_net_Stribeck-20250113 参数部分是一步辨识的。

