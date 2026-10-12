function cands = sc_build_candidates(D)
% 18 mentally simulated moves: 6 single-joint, 12 two-joint.
cands = cell(1, 18);
n = 0;
for j = 1:3
    for s = [D, -D]
        n = n + 1;
        cands{n} = [j, s];
    end
end
for j = 1:2
    for k = (j+1):3
        for sj = [D, -D]
            for sk = [D, -D]
                n = n + 1;
                cands{n} = [j, sj; k, sk];
            end
        end
    end
end
