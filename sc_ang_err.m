function e = sc_ang_err(hand_dir, axis)
% Fingers must CROSS the grip to wrap it: hand direction near
% perpendicular to the grip axis. Axis has no front or back, so the
% absolute dot product handles both crossing directions.
d = abs(hand_dir(1)*axis(1) + hand_dir(2)*axis(2));
d = min(1, d);
e = abs(pi/2 - acos(d));
