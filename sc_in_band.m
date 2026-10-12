function ok = sc_in_band(s, geom)
dR = norm(s - geom.sh_R);
dL = norm(s - geom.sh_L);
ok = dR > 0.17 && dR < 0.31 && dL > 0.17 && dL < 0.31 && ...
     s(1) > 0.34 && s(1) < 0.72 && s(2) > 0.40 && s(2) < 0.57;
