function [sh, p1, p2, tip] = sc_fk(theta, side, geom)
if side == 'R'
    sh = geom.sh_R;
else
    sh = geom.sh_L;
end
a1 = theta(1);
p1 = sh + geom.L1 * [cos(a1), sin(a1)];
a2 = a1 + theta(2);
p2 = p1 + geom.L2 * [cos(a2), sin(a2)];
a3 = a2 + theta(3);
tip = p2 + geom.L3 * [cos(a3), sin(a3)];
