function [p] = define_sampling_mask(p)
    p.scan.mask.mask = zeros([p.scan.dim_y p.scan.dim_x]);
    switch p.scan.mask.type
        case 0
            p.scan.mask.mask = ones([p.scan.dim_y p.scan.dim_x]);
        case 1
            p.scan.mask.mask = uds(p.scan.mask.sampling,p.scan.dim_y, p.scan.dim_x);
        case 2
            p.scan.mask.mask = linehop(p.scan.mask.sampling,p.scan.dim_y, p.scan.dim_x);
        case 3
            p.scan.mask.mask = blockconstrained(p.scan.mask.sampling,p.scan.dim_y, p.scan.dim_x);
    end
end