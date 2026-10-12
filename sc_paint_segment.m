function img = sc_paint_segment(img, p1, p2, radius, color, PXW, PYW)
v = p2 - p1;
L2v = v(1)^2 + v(2)^2;
if L2v < 1e-12
    T = zeros(size(PXW));
else
    T = ((PXW - p1(1)) * v(1) + (PYW - p1(2)) * v(2)) / L2v;
    T = min(1, max(0, T));
end
CX = p1(1) + T * v(1);
CY = p1(2) + T * v(2);
D = sqrt((PXW - CX).^2 + (PYW - CY).^2);
M = D <= radius;
for c = 1:3
    ch = img(:,:,c);
    ch(M) = color(c);
    img(:,:,c) = ch;
end
