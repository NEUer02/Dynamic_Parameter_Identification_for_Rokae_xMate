function [output] = Optimal_Object(parameters)

%OPTIMAL_OBJECT 此处显示有关此函数的摘要
%   此处显示详细说明
t_filt = evalin('base', 't_filt');
ww = evalin('base', 'ww');

torque_matrix_tmp = ww * parameters;
torque_matrix = reshape(torque_matrix_tmp, [7, 20001]);

output = norm(t_filt - torque_matrix')^2;
end
