for i = 1 : 7
    figure;
    plot(t_filt(:, i), 'b', 'LineWidth', 1.5); 
    hold on;
    plot(torque_identified(:, i), 'r', 'LineWidth', 1.0);
    plot(error_for_friction(:, i), 'g', 'LineWidth', 1.0);
    plot(qd_filt(:, i), 'y', 'LineWidth', 1.0);
    hold off;
    grid on;
    ylabel('力矩(N/m)/关节速度');
    legend('采集力矩', '辨识力矩', '误差', '关节速度');
    title(['第', num2str(i), '关节辨识参数验证']);
    set(gcf, 'Position', [-1650 500 4200 800]);
    ax = gca;
    exportgraphics(ax, ['.\figs\idy\idy', num2str(i), '.png'], "Resolution", 300);
end