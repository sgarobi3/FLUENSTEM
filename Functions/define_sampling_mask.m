function [p] = define_sampling_mask(p,custom_mask)
    if nargin<2
        p.scan.mask.mask = zeros([p.scan.dim_y p.scan.dim_x]);
    end
    switch p.scan.mask.type
        case 0
            p.scan.mask.mask = ones([p.scan.dim_y p.scan.dim_x]);
        case 1
            p.scan.mask.mask = uds(p.scan.mask.sampling,p.scan.dim_y, p.scan.dim_x);
        case 2
            p.scan.mask.mask = linehop(p.scan.mask.sampling,p.scan.dim_y, p.scan.dim_x);
        case 3
            p.scan.mask.mask = blockconstrained(p.scan.mask.sampling,p.scan.dim_y, p.scan.dim_x);
        case 4
            p.scan.mask.mask = custom_mask;
        case 5
            p.scan.mask.mask = uniform(p.scan.mask.sampling,p.scan.dim_y, p.scan.dim_x);
    end
end