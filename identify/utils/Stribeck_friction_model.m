function [expression] = Stribeck_friction_model(velocity, gamma)
%STRIBECK_FRICTION_MODEL Stribeck摩擦力模型
% INPUT:
%   velocity——关节速度
%   gamma——模式选择
%          gamma = 1 —— Tustin 模型
%          gamma = 2 —— Gaussian 指数模型
%
% OUTPUT:
%   expression——符号表达式

syms fc fs vs fv;
expression = sign(velocity) * (fc + (fs - fc) * exp(-1 * abs(velocity / vs) * gamma)) + fv * velocity;
end

