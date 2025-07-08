traj_Ts = 0.001;
t = linspace(0, n_sample - 1, n_sample) * traj_Ts;

for i = 1 : 7
    figure;
    plot(t, error_for_friction(:, i), 'r', 'LineWidth', 1); 
    hold on;
    plot(t, friction_identified(:, i), 'b', 'LineWidth', 1);
    plot(t, friction_identified_Stribeck(:, i), 'LineWidth', 1);
    plot(t, friction_identified_traditional(:, i), 'LineWidth', 1);
    % plot(t, error(:, i), 'g', 'LineWidth', 1.0);
    % plot(t, qd_filt(:, i), 'k', 'LineWidth', 2.0);
    hold off;
    grid on;
    ylabel('torque(N/m)', 'FontSize', 12);
    legend('目标摩擦力', '改进Stribeck', '标准Stribeck', '库伦-粘滞', 'FontSize', 12);
    legend('boxoff');
    % title(sprintf('excitation trajectory - %d', i));
    % title(['第', num2str(i), '关节辨识参数验证']);
end

% for i = 1 : 7
%     figure;
%     plot(t, error_for_friction_unknown1(:, i), 'r', 'LineWidth', 1.5); 
%     hold on;
%     plot(t, friction_identified_unknown1(:, i), 'b', 'LineWidth', 1.5);
%     plot(t, error_unknown1(:, i), 'g', 'LineWidth', 1.0);
%     hold off;
%     grid on;
%     ylabel('torque(N/m)', 'FontSize', 12);
%     legend('target friction', 'identified friction', 'error', 'FontSize', 12);
%     title(sprintf('unknown trajectory 1 - %d', i));
% end
% 
% for i = 1 : 7
%     figure;
%     plot(t, error_for_friction_unknown2(:, i), 'r', 'LineWidth', 1.5); 
%     hold on;
%     plot(t, friction_identified_unknown2(:, i), 'b', 'LineWidth', 1.5);
%     plot(t, error_unknown2(:, i), 'g', 'LineWidth', 1.0);
%     hold off;
%     grid on;
%     ylabel('torque(N/m)', 'FontSize', 12);
%     legend('target friction', 'identified friction', 'error', 'FontSize', 12);
%     title(sprintf('unknown trajectory 2 - %d', i));
% end