function [expression] = Stribeck_friction_model(velocity, gamma, fc, fs, vs, fv)
%STRIBECK_FRICTION_MODEL Stribeck摩擦力模型
%模型来源：基于混合遗传算法的机器人改进摩擦模型辨识
%论文网址：https://www.zjujournals.com/eng/article/2021/1008-973X/202105001.shtml
%
% INPUT:
%   velocity——关节速度
%   gamma——模式选择
%          gamma = 1 —— Tustin 模型
%          gamma = 2 —— Gaussian 指数模型
%   fc——库仑摩擦系数
%   fs——最大静摩擦力系数
%   vs——Stribeck速度阈值
%   fv——粘性摩擦系数
%
% OUTPUT:
%   expression——符号表达式

expression = sign(velocity) * (fc + (fs - fc) * exp(-1 * abs(velocity / vs) * gamma)) + fv * velocity;
end

