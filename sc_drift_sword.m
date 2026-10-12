function s = sc_drift_sword(s, heading, speed, dt, geom)
nxt = s + speed * dt * [cos(heading), sin(heading)];
if sc_in_band(nxt, geom)
    s = nxt;
    return;
end
ctr = [0.53, 0.485];
v = ctr - s;
v = v / (norm(v) + 1e-9);
nxt = s + speed * dt * v;
if sc_in_band(nxt, geom)
    s = nxt;
end
