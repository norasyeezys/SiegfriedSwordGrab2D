function [pos, axis_cv, npx, ok, axok] = sc_cv_find_sword(img, cam)
% CV module. Pixels in; grip position AND grip axis out.
% Axis = principal direction of the red pixel spread (eigenvector of
% the 2x2 pixel covariance, largest eigenvalue). Needs enough pixels
% to be trustworthy, so the axis gate sits at 25 px.
R = img(:,:,1); G = img(:,:,2); B = img(:,:,3);
M = (R > 0.6) & (G < 0.35) & (B < 0.35);
npx = sum(M(:));
pos = [NaN, NaN];
axis_cv = [NaN, NaN];
ok = false;  axok = false;
if npx < 8
    return;
end
[rows, cols] = find(M);
pxc = mean(cols);
pyc = mean(rows);
pos = [cam.wx0 + (pxc - 1)/(cam.W - 1)*(cam.wx1 - cam.wx0), ...
       cam.wy0 + (cam.H - pyc)/(cam.H - 1)*(cam.wy1 - cam.wy0)];
ok = true;
if npx >= 25
    xs = cam.wx0 + (cols - 1)/(cam.W - 1)*(cam.wx1 - cam.wx0);
    ys = cam.wy0 + (cam.H - rows)/(cam.H - 1)*(cam.wy1 - cam.wy0);
    mx = mean(xs);  my = mean(ys);
    cxx = mean((xs - mx).^2);
    cyy = mean((ys - my).^2);
    cxy = mean((xs - mx).*(ys - my));
    C = [cxx, cxy; cxy, cyy];
    [Vec, Dval] = eig(C);
    dv = diag(Dval);
    if dv(2) >= dv(1)
        a = Vec(:, 2);
    else
        a = Vec(:, 1);
    end
    axis_cv = [a(1), a(2)] / norm(a);
    axok = true;
end
