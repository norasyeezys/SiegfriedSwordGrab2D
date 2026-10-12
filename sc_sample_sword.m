function s = sc_sample_sword(geom)
% On the table in front of him: 0.17 to 0.31 m from each shoulder.
while true
    s = [0.34 + rand()*0.38, 0.40 + rand()*0.17];
    dR = norm(s - geom.sh_R);
    dL = norm(s - geom.sh_L);
    if dR > 0.17 && dR < 0.31 && dL > 0.17 && dL < 0.31
        break;
    end
end
