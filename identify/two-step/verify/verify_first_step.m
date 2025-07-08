traj_Ts = 0.001;
t = linspace(0, n_sample - 1, n_sample) * traj_Ts;
bias = [0.7128, 0.0704, 0.3919, 0.1, 0.2944, -0.0296, -0.0389]; 

for i = 1 : 7
    figure();
    plot(t, t_filt(:, i), 'b', 'LineWidth', 1.5); 
    hold on;
    plot(t, torque_identified(:, i), 'g', 'LineWidth', 1.5);
    plot(t, error_for_friction(:, i), 'r', 'LineWidth', 1.5);
    plot(t, error_for_friction(:, i) + bias(i), 'm', 'LineWidth', 1.5);
    hold off;
    grid on;

    ylabel('力矩(N/m)', 'FontSize', 12);
    xlabel('时间(s)', 'FontSize', 12);
    legend('真实力矩', '辨识力矩', '摩擦力', '改进的摩擦力', 'FontSize', 12);
%     title(sprintf('激励轨迹 - %d', i), 'FontSize', 14);
%     ylabel('torque(N/m)', 'FontSize', 14);
%     xlabel('time(s)', 'FontSize', 14);
%     legend('real torque', 'identified torque', 'estimated friction', 'proposed', 'FontSize', 14);
%     title(sprintf('excitation trajectory - %d', i));
end

% for i = 1 : 7
%     figure;
%     plot(t, t_filt_unknown1(:, i), 'b', 'LineWidth', 1.5); 
%     hold on;
%     plot(t, torque_identified_unknown1(:, i), 'g', 'LineWidth', 1.0);
%     plot(t, error_for_friction_unknown1(:, i), 'r', 'LineWidth', 2.0);
%     hold off;
%     grid on;
% 
%     ylabel('torque(N/m)', 'FontSize', 14);
%     xlabel('time(s)', 'FontSize', 14);
%     legend('real torque', 'identified torque', 'estimated friction', 'FontSize', 14);
%     title(sprintf('unknown trajectory 1 - %d', i));
% end
% 
% for i = 1 : 7
%     figure;
%     plot(t, t_filt_unknown2(:, i), 'b', 'LineWidth', 1.5); 
%     hold on;
%     plot(t, torque_identified_unknown2(:, i), 'g', 'LineWidth', 1.0);
%     plot(t, error_for_friction_unknown2(:, i), 'r', 'LineWidth', 2.0);
%     hold off;
%     grid on;
% 
%     ylabel('torque(N/m)', 'FontSize', 14);
%     xlabel('time(s)', 'FontSize', 14);
%     legend('real torque', 'identified torque', 'estimated friction', 'FontSize', 14);
%     title(sprintf('unknown trajectory 2 - %d', i));
% end