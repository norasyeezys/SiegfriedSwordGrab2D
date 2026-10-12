function theta = sc_clip_limits(theta, side, lims)
if side == 'R'
    L = lims.R;
else
    L = lims.L;
end
for j = 1:3
    theta(j) = min(L(j,2), max(L(j,1), theta(j)));
end
