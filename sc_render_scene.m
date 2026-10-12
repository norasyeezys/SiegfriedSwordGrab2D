function img = sc_render_scene(theta_R, theta_L, sword, PXW, PYW, geom, BDIR)
% Photons. SWORD PAINTED FIRST, ARMS AFTER - his own body can and does
% block his view of the grip. That is the occlusion upgrade.
H = size(PXW, 1); W = size(PXW, 2);
img = zeros(H, W, 3);
img(:,:,1) = 0.05; img(:,:,2) = 0.05; img(:,:,3) = 0.08;

img = sc_paint_segment(img, sword, sword + 0.10*BDIR, 0.004, [0.85 0.85 0.90], PXW, PYW);
img = sc_paint_segment(img, sword - 0.018*BDIR, sword + 0.018*BDIR, 0.006, [0.90 0.10 0.10], PXW, PYW);

arm_col = [0.30, 0.40, 0.60];
sides = 'RL';
for k = 1:2
    if k == 1, th = theta_R; else th = theta_L; end
    [sh, p1, p2, tip] = sc_fk(th, sides(k), geom);
    img = sc_paint_segment(img, sh, p1, 0.008, arm_col, PXW, PYW);
    img = sc_paint_segment(img, p1, p2, 0.007, arm_col, PXW, PYW);
    img = sc_paint_segment(img, p2, tip, 0.006, arm_col, PXW, PYW);
    img = sc_paint_segment(img, tip, tip, geom.palm, arm_col, PXW, PYW);  % the palm
end
