function [output] = Optimal_object_first_step(parameters)
%% 准备工作与参数加载
t_filt = evalin('base', 't_filt');
ww = evalin('base', 'ww');

base_inertial_parameters = transform_parameters(parameters);

T_idy = ww * base_inertial_parameters';
T_idy = reshape(T_idy, 7, []);

%% 计算欧式距离
output = norm(t_filt - T_idy')^2;
end
