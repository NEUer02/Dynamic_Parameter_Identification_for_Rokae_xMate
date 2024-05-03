traj_Ts = 0.001;
t = linspace(0, n_sample - 1, n_sample) * traj_Ts;

for i = 1 : 7
    figure;
    plot(t, t_filt(:, i), 'b', 'LineWidth', 1.5); 
    hold on;
    plot(t, torque_identified(:, i), 'g', 'LineWidth', 1.0);
    plot(t, error_for_friction(:, i), 'r', 'LineWidth', 2.0);
    hold off;
    grid on;

    ylabel('torque(N/m)', 'FontSize', 14);
    xlabel('time(s)', 'FontSize', 14);
    legend('real torque', 'identified torque', 'estimated friction', 'FontSize', 14);
end