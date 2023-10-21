function [p] = define_reciprocal_space(p)
    p.global.delta_d_x = p.global.lambda/(p.probe.dim_x*p.global.delta_e);
    p.global.delta_d_y = p.global.lambda/(p.probe.dim_y*p.global.delta_e);
    p.global.kx = p.global.delta_d_x.*linspace(-p.probe.dim_x/2,p.probe.dim_x/2,p.probe.dim_x);
    p.global.ky = p.global.delta_d_y.*linspace(-p.probe.dim_y/2,p.probe.dim_y/2,p.probe.dim_y);
    [p.global.Kx,p.global.Ky] = meshgrid(p.global.kx,p.global.ky);
end