n_parameters = 5;

% 下限
lb = [0, 0, 0, 0.1, -5];
% 上限
ub = [15, 15, 15, 15, 5];

%% fmincon方法
% 初始化摩擦力模型参数
opt_x0 = zeros(n_parameters, 1) + 1;
opt_x2 = zeros(n_parameters * 7, 1);

% 设置优化器
object = @Optimal_object_second_step;
nonlcon = @Optimize_constraints_second_step;
options = optimoptions(@fmincon, 'MaxIterations', 200000, 'MaxFunctionEvaluations', 200000);

% 优化参数
for i = 1 : 7
    error_for_friction_tmp = error_for_friction(:, i);
    qd_filt_tmp = qd_filt(:, i);
    start_row = (i - 1) * n_parameters + 1;
    end_row = i * n_parameters;

    [opt_x2(start_row : end_row), ~] = fmincon(object, opt_x0, [], [], [], [], lb, ub, nonlcon, options);
end

% %% 粒子群优化
% % 下限
% lb = [0, 0, 0, 0.1, -5];
% % 上限
% ub = [20, 20, 20, 20, 5];
% 
% for i = 1 : 7
%     error_for_friction_tmp = error_for_friction(:, i);
%     qd_filt_tmp = qd_filt(:, i);
%     start_row = (i - 1) * n_parameters + 1;
%     end_row = i * n_parameters;
% 
%     [opt_x2(start_row : end_row), ~] = particleswarm(object, n_parameters, lb, ub);
% end
