%% 路径与数据加载
addpath '.\Stribeck'; addpath '.\utils'; addpath '.\semi-parameters';
load('data\filtering_data_no_downsampling.mat')
load('data\parameters_identified\Stribeck\parameters_Stribeck_2023-11-06_09-55.mat');

%% 采样参数
sample_frequence = 1000;
sample_period = 1 / sample_frequence;

%% 关节定义
Joint1 = 1; Joint2 = 2; Joint3 = 3; Joint4 = 4; 
Joint5 = 5; Joint6 = 6; Joint7 = 7;
Joint = [Joint1; Joint2; Joint3; Joint4; Joint5; Joint6; Joint7];

%% 参数部分参数
gamma = 2;

%% 非参数部分参数
% 数据集生成参数
frame_length = 1000;
slide_percent = 0.5;
num_factors = 5;

% 数据集划分参数
train_percent = 0.8;

% 训练参数
BatchSize = 1500;
Epochs = 2000;