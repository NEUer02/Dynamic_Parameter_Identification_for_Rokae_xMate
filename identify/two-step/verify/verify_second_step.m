traj_Ts = 0.001;
t = linspace(0, n_sample - 1, n_sample) * traj_Ts;

for i = 1 : 7
    figure;
    plot(t, error_for_friction(:, i), 'r', 'LineWidth', 1.5); 
    hold on;
    plot(t, friction_identified(:, i), 'b', 'LineWidth', 1.5);
    plot(t, error(:, i), 'g', 'LineWidth', 1.0);
    % plot(t, qd_filt(:, i), 'k', 'LineWidth', 2.0);
    hold off;
    grid on;
    ylabel('torque(N/m)', 'FontSize', 12);
    legend('e1', 'identified friction', 'error', 'FontSize', 12);
    % title(['第', num2str(i), '关节辨识参数验证']);
end