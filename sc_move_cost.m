function c = sc_move_cost(theta, side, geom, est, axis_use, K_ANG, R_ANG)
[~, ~, p2, tip] = sc_fk(theta, side, geom);
d = norm(tip - est);
hd = (tip - p2) / norm(tip - p2);
w = max(0, 1 - d / R_ANG);
c = d + K_ANG * w * sc_ang_err(hd, axis_use);
