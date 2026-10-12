function sc_draw_world(fig, theta_R, theta_L, sword, est, axis_use, img, geom, t_now, side, sight, grabs)
figure(fig);
BDIR = [0.03, 0.10] / norm([0.03, 0.10]);

subplot(1, 2, 1);
cla; hold on;
plot([geom.sh_L(1), geom.sh_R(1)], [geom.sh_L(2), geom.sh_R(2)], '-', ...
    'Color', [0.5 0.5 0.55], 'LineWidth', 6);
sides = 'RL';
for k = 1:2
    if k == 1, th = theta_R; else th = theta_L; end
    [sh, p1, p2, tip] = sc_fk(th, sides(k), geom);
    if sides(k) == side
        col = [0.95 0.75 0.20];
    else
        col = [0.35 0.45 0.65];
    end
    plot([sh(1) p1(1) p2(1) tip(1)], [sh(2) p1(2) p2(2) tip(2)], '-o', ...
        'Color', col, 'LineWidth', 3, 'MarkerSize', 4, 'MarkerFaceColor', col);
    plot(tip(1), tip(2), 'o', 'Color', col, 'MarkerSize', 11, 'MarkerFaceColor', col);
end
bt = sword + 0.10 * BDIR;
plot([sword(1) bt(1)], [sword(2) bt(2)], '-', 'Color', [0.85 0.85 0.9], 'LineWidth', 2);
plot(sword(1), sword(2), 's', 'Color', [0.9 0.1 0.1], ...
    'MarkerFaceColor', [0.9 0.1 0.1], 'MarkerSize', 8);
if ~any(isnan(est))
    plot(est(1), est(2), 'x', 'Color', [0.2 1.0 0.4], 'MarkerSize', 12, 'LineWidth', 2);
    if ~any(isnan(axis_use))
        aa = 0.025 * axis_use;
        plot([est(1)-aa(1), est(1)+aa(1)], [est(2)-aa(2), est(2)+aa(2)], '-', ...
            'Color', [0.2 1.0 0.4], 'LineWidth', 1.5);
    end
end
axis equal;
axis([0.15 0.85 0.15 0.65]);
set(gca, 'Color', [0.08 0.08 0.1], 'XColor', [0.6 0.6 0.6], 'YColor', [0.6 0.6 0.6]);
title(sprintf('World (physics)   t = %.1f s   grabs: %d', t_now, grabs), 'Color', [0.9 0.9 0.9]);

subplot(1, 2, 2);
cla;
image(img);
axis image;
hold on;
if ~any(isnan(est))
    W = size(img, 2); H = size(img, 1);
    px = 1 + (est(1) - 0.15) / (0.85 - 0.15) * (W - 1);
    py = H - (est(2) - 0.15) / (0.65 - 0.15) * (H - 1);
    plot(px, py, 'x', 'Color', [0.2 1.0 0.4], 'MarkerSize', 14, 'LineWidth', 2);
end
set(gca, 'XTick', [], 'YTick', []);
if strcmp(sight, 'CLEAR')
    tc = [0.4 0.9 0.5];
elseif strcmp(sight, 'MEMORY')
    tc = [0.95 0.8 0.3];
else
    tc = [0.95 0.4 0.3];
end
title(sprintf('Retina - sight: %s', sight), 'Color', tc);

drawnow;
